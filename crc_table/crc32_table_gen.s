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
  bgeu r2, r1, end # Se acabou o for, acabou a tabela

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

end:
  br -0x4
 

 

