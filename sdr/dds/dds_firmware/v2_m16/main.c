/*
 * main.c
 *
 *  Created on: Mar 1, 2015
 *      Author: wykys
 */



#include <avr/io.h>
#define F_CPU 11059000UL
#include <util/delay.h>

#define DDS_FQ_UD	PA0
#define DDS_W_CLK	PA1
#define DDS_LOAD	PA2
#define DDS_RESET	PA3

#define LED			PA4

#define LCD_RS		PA6
#define LCD_EN		PA7
// =========================================
#define FQ_UD1 (PORTA |= (1<<DDS_FQ_UD))
#define FQ_UD0 (PORTA &= ~(1<<DDS_FQ_UD))
// =========================================
#define W_CLK1 (PORTA |= (1<<DDS_W_CLK))
#define W_CLK0 (PORTA &= ~(1<<DDS_W_CLK))
// =========================================
#define LOAD1 (PORTA |= (1<<DDS_LOAD))
#define LOAD0 (PORTA &= ~(1<<DDS_LOAD))
// =========================================
#define RESET1 (PORTA |= (1<<DDS_RESET))
#define RESET0 (PORTA &= ~(1<<DDS_RESET))
// =========================================


// =========================================
#define LED1 (PORTA |= (1<<LED))
#define LED0 (PORTA &= ~(1<<LED))
// =========================================


// =========================================
#define LCD_RS1 (PORTA |= (1<<LCD_RS))
#define LCD_RS0 (PORTA &= ~(1<<LCD_RS))
// =========================================
#define LCD_EN1 (PORTA |= (1<<LCD_EN))
#define LCD_EN0 (PORTA &= ~(1<<LCD_EN))
// =========================================
#define LCD_BUS PORTC

const uint8_t ctable[] = {
		0b000110000,	// 0
		0b000110001,	// 1
		0b000110010,	// 2
		0b000110011,	// 3
		0b000110100,	// 4
		0b000110101,	// 5
		0b000110110,	// 6
		0b000110111,	// 7
		0b000111000,	// 8
		0b000111001,	// 9
		0b010010000,	// ' '
		0b001001000,	// H
		0b001111010,	// z
		0b001100110,	// f
		0b001110011,	// s
		0b000111010		// :
};

void dds_Init(void)
{
	DDRA = 0xFF;	// L in H out
	PORTA = 0x08;	// reset in L
}

void dds_Reset(void)
{
	// set output pin value
	RESET0;
	FQ_UD0;
	W_CLK0;
	LOAD0;

	// reset AD9850
	RESET0;
	_delay_ms(5);
	RESET1;
	_delay_ms(5);
	RESET0;
	_delay_ms(5);

	//serial mode enable
	W_CLK0;
	W_CLK1;
	W_CLK0;

	FQ_UD0;
	FQ_UD1;
	FQ_UD0;
}

void dds_SendBit(uint8_t bit)
{
	(bit) ? LOAD1 : LOAD0;
	W_CLK0;
	W_CLK1;
	W_CLK0;
}

void dds_SetFreq(double freq) // frequency = out frequency in Hz
{
	uint32_t phase;
	phase = (freq*0xFFFFFFFF)/100000000UL;

	uint8_t i;
	for (i=0; i<32; i++)
		dds_SendBit((phase>>i) & 1);

	for (i=0; i<8; i++)
		dds_SendBit(0);

	FQ_UD0;
	FQ_UD1;
	FQ_UD0;

}

void LCD_Com(uint8_t command)
{
	LCD_EN0;
	LCD_RS0;

	LCD_BUS = command;
	LCD_EN1;
	LCD_EN0;
	if (command == 0b00000001 || command == 0b00000010 || command == 0b00000011)
		_delay_ms(2);
	else
		_delay_us(50);
}

void LCD_Write(uint8_t c)
{
	LCD_EN0;
	LCD_RS1;

	LCD_BUS = ctable[c];

	LCD_EN1;
	LCD_EN0;
	_delay_us(50);
}

void LCD_Update(double freq, double step)
{
	// smazat
	LCD_Com(0b00000001);

	// zápis 1. řádek
	LCD_Com(0b10000000);

	uint32_t i,j;
	int32_t f = (int32_t) freq;
	int32_t s = (int32_t) step;
	uint8_t flag = 1;

	LCD_Write(13);
	LCD_Write(15);
	LCD_Write(10);

	for (i=0, j=10000000; i<8; i++, j/=10)
	{
		if (f/j)
		{
			flag = 0;
			LCD_Write(f/j);
			f -= j*(f/j);
		}
		else
			if (f && flag)
				LCD_Write(10);
			else
				LCD_Write(0);
		// formatovaci mezery
		if (i == 1 || i == 4)
			LCD_Write(10);
	}

	LCD_Write(10);
	LCD_Write(11);
	LCD_Write(12);



	// zápis 2. řádek
	LCD_Com(0b11000000);

	LCD_Write(14);
	LCD_Write(15);
	LCD_Write(10);

	flag = 1;
	for (i=0, j=10000000; i<8; i++, j/=10)
	{
		if (s/j)
		{
			flag = 0;
			LCD_Write(s/j);
			s -= j*(s/j);
		}
		else
			if (s && flag)
				LCD_Write(10);
			else
				LCD_Write(0);

		// formatovaci mezery
		if (i == 1 || i == 4)
			LCD_Write(10);
	}

	LCD_Write(10);
	LCD_Write(11);
	LCD_Write(12);

}

void LCD_Init(void)
{
	// inicializace
	LCD_Com(0b00111011);
	// kurzor
	LCD_Com(0b00001100);
}



int main(void)
{
	DDRB = 0x00;	// L in H out
	PORTB = 0xFF;	// set Pull-up

	DDRC = 0xFF;
	PORTC = 0x00;

	// on PB2 is ENC RED
	// on PB3 is ENC GREEN

	double f = 10000000;
	double step = 1000000;

	uint8_t state, old_state;
	uint8_t mode = 0;

	dds_Init();
    dds_Reset();
    dds_SetFreq(f);

    LCD_Init();
    LCD_Update(f, step);

    state = (((PINB & (1<<PB3)) | (PINB & (1<<PB2))) >> 2);

    while(1)
    {
    	while ((state == (((PINB & (1<<PB3)) | (PINB & (1<<PB2))) >> 2)) && ((PINB & (1<<PB0)) == 1) ) // počkej dokud se neotočí
    		;
    	// kontorla stisku tlačítka
    	if ((PINB & (1<<PB0)) == 0)
    	{
    		mode = (mode) ? 0 : 1;

    		(mode) ? LED1 : LED0;

    		while ((PINB & (1<<PB0)) == 0)
    			;

    	}
    	else // není stusknuto tlačítko
    	{
			old_state = state; // přesuň předchozí stav do historie
			state = (((PINB & (1<<PB3)) | (PINB & (1<<PB2))) >> 2); // ulož nový stav

			// vyhodnocení změny
			if ( (old_state == 3 && state == 2) || (old_state == 2 && state == 0) ||  (old_state == 0 && state == 1) || (old_state == 1 && state == 3) ) //otočení směr plus
			{
				if (mode == 0) // mód lazení frekvence
				{
					if (f+step <= 50000000)
					{
						f += step;
						dds_SetFreq(f);
						LCD_Update(f, step);
					}
				}
				else // mód změny kroku lazení
					if (step*10 <= 10000000)
					{
						step *= 10;
						LCD_Update(f, step);
					}
			}
			else // otočení směr minus
			{
				if (mode == 0) // mód lazení frekvence
				{
					if (f-step >= 1000000)
					{
						f -= step;
						dds_SetFreq(f);
						LCD_Update(f, step);
					}
				}
				else // mód změny kroku lazení
					if (step/10 >= 1)
					{
						step /= 10;
						LCD_Update(f, step);
					}
			}
    	}
    }
}
