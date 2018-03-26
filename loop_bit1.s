// Não existe nenhuma instrução pra comparar o primeiro bit.

// Uma saída é colocar comparar signed com o registrador r0, zero, que já vem reservado. Caso seja maior ou igual, primeiro bit é zero. Caso seja menor, 1.


bge r0, r2, shift_bit // Caso primeiro bit 0, shift pra procurar o 1. r2 é reg com msg atual.


// Depois bit shift com esse bit.
// Armazena a quantidade de bits shifted.

shift_bit:
 sll r3, r2, r10 // r10 contém 1

    
    

// Ao achar o 1, rotaciona os bits pela quantidade de bits shifted e da shift com base no próximo registrador. Ao chegar em 32 shifted, simplesmente ignora o registrador atual e começa no próximo.


