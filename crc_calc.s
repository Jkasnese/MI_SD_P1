.data

msg: .word 0x0

.text

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

add r4, r4, r7

ldw r6, 0(r4)

xor r2, r2, r6

addi r3, r3, 0x1

br crc_loop

final_xor:
  xori r2, r2, 0x0

stw r2, 0x810(r0)

br -0x4 
