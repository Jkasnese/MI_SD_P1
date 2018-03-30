// Não existe nenhuma instrução pra comparar o primeiro bit.

// Uma saída é colocar comparar signed com o registrador r0, zero, que já vem reservado. Caso seja maior ou igual, primeiro bit é zero. Caso seja menor, 1.


bge r2, r0, shift_msg_left // Caso primeiro bit 0, shift pra procurar o 1. r2 é reg com msg atual.
// Faz XOR etc


// Depois bit shift com esse bit.
// Armazena a quantidade de bits shifted.

shift_msg_left:
  sll r2, r2, r10 // r10 contém 1 // é válido gravar no mesmo registrador da operação?
  // É mais rápido conferir logo se próximo msb também é zero e ir adicionando num registrador a quantidade ou conferir o próximo LSB e atribuir o valor certo?
  bge r3, r0, add_one // r3 contém os próximos 32 bits da mensagem
  jmp r28 // r28 contém endereço de conferir msb e mover caso 0.
    
add_one:
  or r2, r2, r10 //r10 contém 1. Adiciona 1 ao lsb.
  jmp r28 // r28 contém endereço de conferir msb e mover caso 0.

// Ao achar o 1, rotaciona os bits pela quantidade de bits shifted e da shift com base no próximo registrador. Ao chegar em 32 shifted, simplesmente ignora o registrador atual e começa no próximo.


