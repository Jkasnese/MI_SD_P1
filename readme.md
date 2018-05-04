ENGLISH

This repository is a CRC-32 MPEG calculator, developed in Assembly for the Nios II Altera softcore and DE0-Nano FPGA.

Developed for the first problem of TEC499 - Digital Systems at Universidade Estadual de Feira de Santana (UEFS)

It calculates the CRC to a msg (at the code) and shows 4 bits on LEDs, from MSB to LSB.
Use the key0 to change the bits shown.
Key1 resets the program.


MAP:

nios_project dir to Nios II project for Quartus 15.0

nios_project_13 dir to Quartus 13.0sp1 project

crc_mem.hex memory inicialization file

crc_tab_calc.s code. Change addresses to switch between 13.0 and 15.0 versions

jnios.s code to Jnios.

crc_calc.ncf Altera Monitor project for nios_project_13.

msg_teste_2 another msg to test.


INSTRUCTIONS:

1- Compile the version of your favorite Quartus and program it into the FPGA. It should run the code for a given msg.

If you change anything:

1- Compile and program

2- Then open Altera Monitor and program the code into the FPGA.
  If it fails, hold the reset key and try again.
  If this fails, you may have to compile and export the .hex file.
    Then go to Processing -> Update Memory Inicialization File. Run Assembler again and program.

------------------------------------- 

PT-BR

Este repositório é uma calculadora de CRC-32 MPEG, desenvolvida em Assembly para o softcore Nios II da Altera e FPGA DE0-Nano.

Desenvolvido para o problema 1 da disciplina TEC499 - Módulo Integrado de Sistemas Digitais na Universidade Estadual de Feira de Santana (UEFS)

Calcula o CRC e mostra de 4 em 4 bits nos LEDs, do mais significativo pro menos significativo.
Use o botão0 pra mudar os LEDs exibidos
Botão1 reseta o programa.


MAPA:

nios_project é o diretório do projeto do Nios II para o Quartus 15.0

nios_project_13 é o diretório para o Quartus 13.0sp1

crc_mem.hex é o arquivo de inicialização de memória

crc_tab_calc.s é o algoritmo de cálculo do CRC para o Nios. Mudar endereços para portabilidade entre 13.0 e 15.0

jnios.s é o algoritmo para o JNios, contendo endereços do JNios.

crc_calc.ncf é o projeto do Altera Monitor para o nios_project_13.

msg_teste_2 contém uma nova mensagem para teste.


INSTRUÇÕES:

1- Compile o código da sua versão preferida do Quartus e programe. O programa já vai rodar, devido ao arquivo de inicialização de memória.

Caso você modifique algo:

1- Compile novamente e programe novamente pelo Quartus

2- Abra o Altera Monitor e programe o código na FPGA.
  Caso falhe, tente segurar o botão de reset e programar.
  Caso persista o erro, exporte um arquivo .hex e use ele para programar no Quartus.
    Vá em Processing -> Update Memory Inicialization File. Rode novamente o Assembler e programe.




