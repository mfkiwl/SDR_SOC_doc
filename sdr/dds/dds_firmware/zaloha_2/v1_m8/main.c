/*
 * main.c
 *
 *  Created on: Mar 1, 2015
 *      Author: wykys
 */



#include <avr/io.h>
#define F_CPU 11059000UL
#include <util/delay.h>

#define DDS_FQ_UD	PD7
#define DDS_W_CLK	PD6
#define DDS_LOAD	PD5
#define DDS_RESET	PD4

#define LCD_RS		PB0
#define LCD_EN		PB1
// =========================================
#define FQ_UD1 (PORTD |= (1<<DDS_FQ_UD))
#define FQ_UD0 (PORTD &= ~(1<<DDS_FQ_UD))
// =========================================
#define W_CLK1 (PORTD |= (1<<DDS_W_CLK))
#define W_CLK0 (PORTD &= ~(1<<DDS_W_CLK))
// =========================================
#define LOAD1 (PORTD |= (1<<DDS_LOAD))
#define LOAD0 (PORTD &= ~(1<<DDS_LOAD))
// =========================================
#define RESET1 (PORTD |= (1<<DDS_RESET))
#define RESET0 (PORTD &= ~(1<<DDS_RESET))
// =========================================


// =========================================
#define LCD_RS1 (PORTB |= (1<<LCD_RS))
#define LCD_RS0 (PORTB &= ~(1<<LCD_RS))
// =========================================
#define LCD_EN1 (PORTB |= (1<<LCD_EN))
#define LCD_EN0 (PORTB &= ~(1<<LCD_EN))
// =========================================
#define LCD_BUS PORTC

uint8_t mode = 0; // určuje jestli se ladí frekvence nebo krok, f=0, s=1

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
		0b000111010,	// :
		0b000000000,	// inv f
		0b000000001		// inv s
};

void LCD_NibleCom(uint8_t data, uint8_t time)
{
	uint8_t A0, A1, A2, A3;

	A0 = (data & 0b1000) >> 3;
	A1 = (data & 0b0100) >> 1;
	A2 = (data & 0b0010) << 1;
	A3 = (data & 0b0001) << 3;

	LCD_EN0;
	LCD_RS0;
	LCD_BUS = A3 | A2 | A1 | A0;
	LCD_EN1;
	LCD_EN0;

	if (time)
		_delay_us(50);
	else
		_delay_ms(2);

	LCD_EN0;
	LCD_RS0;
}

void LCD_NiblePrint(uint8_t data)
{
	uint8_t A0, A1, A2, A3;

	A0 = (data & 0b1000) >> 3;
	A1 = (data & 0b0100) >> 1;
	A2 = (data & 0b0010) << 1;
	A3 = (data & 0b0001) << 3;

	LCD_EN0;
	LCD_RS1;
	LCD_BUS = A3 | A2 | A1 | A0;
	LCD_EN1;
	LCD_EN0;

	_delay_us(50);

	LCD_EN0;
	LCD_RS0;
}

void LCD_Write(uint8_t c)
{
	LCD_NiblePrint((ctable[c] & 0xF0)>>4);
	LCD_NiblePrint(ctable[c] & 0x0F);
}

void LCD_Update(double freq, double step)
{
	// smazat
	//LCD_Com(0b00000001);
	LCD_NibleCom(0b0000,0);
	LCD_NibleCom(0b0001,0);

	// zápis 1. řádek
	//LCD_Com(0b10000000);
	LCD_NibleCom(0b1000,1);
	LCD_NibleCom(0b0000,1);

	uint32_t i,j;
	int32_t f = (int32_t) freq;
	int32_t s = (int32_t) step;
	uint8_t flag = 1;

	f =	(f-6000000 < 0) ? 6000000-f : f-6000000;

	if (mode)
		LCD_Write(13);
	else
		LCD_Write(16);
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
	//LCD_Com(0b11000000);
	LCD_NibleCom(0b1100,1);
	LCD_NibleCom(0b0000,1);

	if (mode)
		LCD_Write(17);
	else
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

	_delay_ms(2000);

	LCD_NibleCom(0b0010,1);
	LCD_NibleCom(0b0010,1);
	LCD_NibleCom(0b1011,1);
	LCD_NibleCom(0b0000,1);
	LCD_NibleCom(0b1111,1);
	LCD_NibleCom(0b0000,0);
	LCD_NibleCom(0b0001,0);


	// tvorba nových znaků negované f a s
	LCD_NibleCom(0b0100,1); // zapos do
	LCD_NibleCom(0b0000,1); // CGRAM

	LCD_NiblePrint(0b0001);	// inv f
	LCD_NiblePrint(0b1001);

	LCD_NiblePrint(0b0001);
	LCD_NiblePrint(0b0110);

	LCD_NiblePrint(0b0001);
	LCD_NiblePrint(0b0111);

	LCD_NiblePrint(0b0000);
	LCD_NiblePrint(0b0011);

	LCD_NiblePrint(0b0001);
	LCD_NiblePrint(0b0111);

	LCD_NiblePrint(0b0001);
	LCD_NiblePrint(0b0111);

	LCD_NiblePrint(0b0001);
	LCD_NiblePrint(0b0111);

	LCD_NiblePrint(0b0000);
	LCD_NiblePrint(0b0000);


	LCD_NibleCom(0b0100,1); // zapos do
	LCD_NibleCom(0b1000,1); // CGRAM

	LCD_NiblePrint(0b0001);	// inv s
	LCD_NiblePrint(0b1111);

	LCD_NiblePrint(0b0001);
	LCD_NiblePrint(0b0001);

	LCD_NiblePrint(0b0000);
	LCD_NiblePrint(0b1111);

	LCD_NiblePrint(0b0001);
	LCD_NiblePrint(0b0001);

	LCD_NiblePrint(0b0001);
	LCD_NiblePrint(0b1110);

	LCD_NiblePrint(0b0000);
	LCD_NiblePrint(0b0001);

	LCD_NiblePrint(0b0001);
	LCD_NiblePrint(0b1111);

	LCD_NiblePrint(0b0000);
	LCD_NiblePrint(0b0000);

	// zápis do DDRAM
	LCD_NibleCom(0b1000,1); // zapos do
	LCD_NibleCom(0b0000,1); // CGRAM
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

int main(void)
{
	DDRB |= (1<<LCD_RS) | (1<<LCD_EN); // L in H out
	PORTB |= (1<<PB2);

	DDRC = 0xFF; // L in H out
	PORTC = 0x00;

	DDRD |= (1<<DDS_FQ_UD) | (1<<DDS_W_CLK) | (1<<DDS_LOAD) | (1<<DDS_RESET);
	PORTD |= (1<<PD2) | (1<<PD3);





	// on PD2 is ENC
	// on PD3 is ENC

	double f = 20000000;
	double step = 10000;



	uint8_t state, old_state;

	dds_Reset();
    dds_SetFreq(f);

    LCD_Init();
    LCD_Update(f, step);


    state = (((PIND & (1<<PD3)) | (PIND & (1<<PD2))) >> 2);


    while(1)
    {
    	while ((state == (((PIND & (1<<PD3)) | (PIND & (1<<PD2))) >> 2)) || ((PINB & (1<<PB2)) == 1)) // počkej dokud se neotočí
    		;

    	// kontorla stisku tlačítka
		if ((PINB & (1<<PB2)) == 0)
		{
			mode = (mode) ? 0 : 1;
			LCD_Update(f, step);

			while ((PINB & (1<<PB2)) == 0)
				;

		}
		else // není stusknuto tlačítko
		{
			old_state = state; // přesuň předchozí stav do historie
			state = (((PIND & (1<<PD3)) | (PIND & (1<<PD2))) >> 2); // ulož nový stav

			// vyhodnocení změny
			//if ( (old_state == 3 && state == 2) || (old_state == 2 && state == 0) ||  (old_state == 0 && state == 1) || (old_state == 1 && state == 3) ) //otočení směr plus
			if ( (old_state == 3 && state == 2)) //otočení směr plus
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
			// kvůli mezipozicím enkodéru ingnorujeme 3 ze 4 stavů
			else if ((old_state == 2 && state == 0) ||  (old_state == 0 && state == 1) || (old_state == 1 && state == 3) )
				;
			else if ((old_state == 0 && state == 2) ||  (old_state == 1 && state == 0) || (old_state == 3 && state == 1) )
				;
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
