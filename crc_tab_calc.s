.data

ola: .word 0xFF

.text

orhi r1, r0, 1 # Tamanho da tabela = 2^16.
movui r4, 0x10 # Quantidade de divisões por número
movia r7, 0x4 # initial table position
# Initializing r9 to hold the poly
movui r9, 0x04C1
slli r9, r9, 0x10
ori r9, r9, 0x1DB7

movui r2, 0x0 # i=0

next_number:
  bgeu r2, r1, calc_crc # Se acabou o for, acabou a tabela

mov r3, r2 # r3 == rem, rem=i

movui r5, 0x0

next_div:
  bge r5, r4, store_number # inner for
  
andi r6, r3, 0x1 # compare lsb
srli r3, r3, 0x1
beq r0, r6, 0x4
xor r3, r3, r9
addi r5, r5, 0x1
br next_div

store_number:
  sth r3, 0(r7)

addi r2, r2, 0x1
addi r7, r7, 0x2

br next_number

calc_crc: 
  movia r1, msg

movia r2, 0xFFFFFFFF # initial xor

# r7 contem tabela

movi r3, 0x0 # i

movia r10, 0xFFFF # low hf mask

crc_loop:
  cmpgei r8, r3, 0x1F4 # repeat 500 times
  bne r8, r0, final_xor

mov r4, r2 # half word "leaving" register tru right. To be xored with msg

and r4, r4, r10

srli r2, r2, 0x10 # removes first halfword

ldh r5, 0(r1)

addi r1, r1, 0x2 # next halfword

xor r4, r4, r5

slli r4, r4, 0x1 # multiply by 2 to get table index.

add r4, r4, r7

ldh r6, 0(r4)

xor r2, r2, r6

addi r3, r3, 0x1

br crc_loop

final_xor:
  xori r2, r2, 0x0

# Rotates bits to show crc from MSB to LSB
roli r2, r2, 0x4

stw r2, 0x810(r0)

# Ler botao em espera ocupada

# r13 eh estado anterior do botao
mov r13, r0

# r12 lê estado atual do botão
ler_botao:
  ldb r12, 0x840(r0)

beq r12, r13, ler_botao

mov r13, r12

beq r12, r0, ler_botao

roli r2, r2, 0x4

stw r2, 0x810

br ler_botao
