#include <avr/io.h>
#define F_CPU 20000000UL
#include <util/delay.h>	

#define DDS_FQ_UD	PA0
#define DDS_WRITE	PA1
#define DDS_LOAD	PA2
#define DDS_RESET	PA3
// =========================================
#define FQ_UD1 (PORTA |= (1<<DDS_FQ_UD))
#define FQ_UD0 (PORTA &= ~(1<<DDS_FQ_UD))
// =========================================
#define WRITE1 (PORTA |= (1<<DDS_WRITE))
#define WRITE0 (PORTA &= ~(1<<DDS_WRITE))
// =========================================
#define LOAD1 (PORTA |= (1<<DDS_LOAD))
#define LOAD0 (PORTA &= ~(1<<DDS_LOAD))
// =========================================
#define RESET1 (PORTA |= (1<<DDS_RESET))
#define RESET0 (PORTA &= ~(1<<DDS_RESET))
// =========================================


#define FIN 100U	// clock frequenci for DDS in MHz


dds_phase(double fout) //output freguenci in MHz
{
	return (fout*0xFFFFFFFF)/FIN;
}

int main(void)
{
	DDRA = 0xFF;	// L in H out
    PORTA = 0x08;	// reset in L

	_delay_ms(100);	// pauza čekání na náběh všech periferií
	
	RESET0;	// DDS enable
	
	
}
