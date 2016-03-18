/*
 * main.c
 *
 *  Created on: Feb 23, 2015
 *      Author: wykys
 */


#include <avr/io.h>
#define F_CPU 20000000UL
#include <util/delay.h>

#define DDS_FQ_UD	PA0
#define DDS_W_CLK	PA1
#define DDS_LOAD	PA2
#define DDS_RESET	PA3
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

#define FIN 100UL



void dds_Init(void)
{
	RESET0;
	FQ_UD0;
	W_CLK0;
	LOAD0;

	W_CLK1;
	W_CLK0;

	FQ_UD1;
	FQ_UD0;
}

void dds_Reset(void)
{
	uint8_t i;
	for (i=0; i<5; i++)
		RESET1;

	RESET0;
}

void dds_SendBit(uint8_t bit)
{
	(bit) ? LOAD1 : LOAD0;
	W_CLK1;
	W_CLK0;
}

void dds_SetFreq(uint32_t phase)
{
	uint8_t i;
	for (i=0; i<32; i++)
		dds_SendBit((phase>>i) & 1);

	for (i=0; i<8; i++)
		dds_SendBit(0);

	FQ_UD1;
	FQ_UD0;
}

uint32_t dds_Phase(double fout) //output freguenci in MHz
{
	return (uint32_t)(fout*0xFFFFFFFF)/FIN;
}

int main(void)
{
	DDRA = 0xFF;	// L in H out
    PORTA = 0x08;	// reset in L

    dds_Reset();
	dds_Init();
	dds_SetFreq(dds_Phase(1));

    while(1)
    {
    	;
    }
}
