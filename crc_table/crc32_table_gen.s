movui r1, r0, 0x10000 // Tamanho da tabela. 2^16
movui r4, r0, 0x10 // Tamanho do registrador
movia r7, 0x50 // initial table position

movui r2, 0x0 // i=0

next_number:
  bgtu r2, r1, end // Se acabou o for, acabou a tabela

mov r3, r2 // r3 == rem, rem=i

movui r5, 0x0

next_div:
  bgt r5, r4, store_number // inner for

cmpgt r6, r0, r3 // compare topbit
slli r3, r3, 0x1
beq r0, r6, 0x4
xor r3, r3, 0x04C11DB7
addi r5, r5, 0x1
br next_div

store_number:
  sth r3, 0(r7)

addi r2, r2, 0x1
addi r7, r7, 0x4

br next_number

 

