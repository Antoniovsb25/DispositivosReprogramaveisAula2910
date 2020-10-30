#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "sys/alt_stdio.h"
// biblioteca pra habilitar o delay
#include <unistd.h>
//Comandos para leitura e escrita nas portas IO
#define PORT(base) IORD_ALTERA_AVALON_PIO_DATA(base)
#define LAT(base, data) IOWR_ALTERA_AVALON_PIO_DATA(base, data)

alt_u8 hex0, key, sw, ledr;

void setup(void){
	LAT(HEX0_AVSB_BASE, 0x5b); //Apenas apago o LED para come�ar no zero (estou escrevendo dois)
}
void loop(void){
	sw = PORT(SW_AVSB_BASE); //li o conteudo que esta na porta SW, que esta conectado minha chave
	ledr = sw; //processamento de dados
	LAT(LEDR_AVSB_BASE, ledr); //minha sa�da t� feita(escrita de dados)

	usleep(10000);

}
int main()
{ 
  alt_putstr("Hello from Nios II!\n");
  setup();

  /* Event loop never exits. */
  while (1) loop();

  return 0;
}
