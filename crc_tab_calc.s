.data

oba: .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 
bla: .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
msg: .word 0xEF938503, 0x3493020AF

.text

movia r1, 0x100 # Tamanho da tabela = 2^8.
movui r4, 0x8 # Quantidade de divisões por número
movia r7, 0x30000 # initial table position
# Initializing r9 to hold the poly
movui r9, 0x04C1
slli r9, r9, 0x10
ori r9, r9, 0x1DB7

movui r2, 0x0 # i=0

# FOR prox numero tabela

next_number:
  bgeu r2, r1, calc_crc # Se acabou o for, acabou a tabela

mov r3, r2 # r3 == rem, rem=i

movui r5, 0x0 # j = 0

# XOR's FOR

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
addi r7, r7, 0x1

br next_number

# END XOR FOR

# END TABELA FOR

calc_crc: 
  movia r1, msg

movia r2, 0xFFFFFFFF # initial xor

# r7 contem tabela

movi r3, 0x0 # i

movia r10, 0xF # low_byte mask. Não é mais rápido fazer andi?

movia r8, 0x3E8 # repeat 1000 times. 8000 (msg size) / 8 (xor size) = 3E8 # Não é mais rápido comparar com inteiro?

crc_loop:
  bge r3, r8, final_xor # Não é mais rápido comparar logo com inteiro?

mov r4, r2 # byte "leaving" register tru right. To be xored with msg

# gets r4 low byte
and r4, r4, r10 # Não é mais rápido andi logo com inteiro?

srli r2, r2, 0x8 # removes less significant byte

ldh r5, 0(r1) # Gets bytes from msg

addi r1, r1, 0x1 # points to next byte on msg

xor r4, r4, r5 # xor bytes from msg and reg

add r4, r4, r7

ldh r6, 0(r4)

xor r2, r2, r6

addi r3, r3, 0x1

br crc_loop

final_xor:
  xori r2, r2, 0x0

# Rotates bits to show crc from MSB to LSB
# roli r2, r2, 0x4 # CONFERIR RESULTADO E MODO DE EXIBIÇÃO

stw r2, 0x810(r0) # CONFERIR ENDEREÇO LED

# Ler botao em espera ocupada

# r13 eh estado anterior do botao
mov r13, r0

# r12 lê estado atual do botão
ler_botao:
  ldb r12, 0x840(r0) # CONFERIR ENDEREÇO BOTAO

beq r12, r13, ler_botao

mov r13, r12

bne r12, r0, ler_botao

roli r2, r2, 0x4

stw r2, 0x810(r0) # CONFERIR ENDEREÇO LED

br ler_botao
