movia r1, msg

movi r2, 0xFFFFFFFF // initial xor

// r7 contem tabela

movi r3, 0x0 // i

crc_loop:
  bgti r3, 0x1F4, final_xor // repeat 500 times

srl r4, r2, 0x10 // half word "leaving" register tru left. To be xored with msg

sll r2, r2, 0x10 // removes first halfword

ldh r5, 0(r1)

addi r1, r1, 0x2 // conferir se é 2 mesmo pra pegar próxima halfword.

xor r4, r4, r5

add r4, r4, r7

ldw r6, 0(r4)

xor r2, r2, r6

addi r3, r3, 0x1

br crc_loop

final_xor:
  xori r2, r2, 0xFFFFFFFF

str r2, 0x810(r0)

br -0x4 
