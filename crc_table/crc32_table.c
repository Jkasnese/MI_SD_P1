#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define TOPBIT (1 << 31)
#define TAMANHO_TABELA 65536 // 65536 to 2^16. 256 to 2^8

int main() {

//    int table[TAMANHO_TABELA];
    
    FILE* arq_tabela = fopen("arquivo_tabela.txt","w");
    unsigned int i;
    int rem;
    int j;

    for (i = 0; i < TAMANHO_TABELA; i++) { // 2^32
	    rem = i;  /* remainder from polynomial division */
	    for (j = 0; j < 16; j++) {
		    if (rem & TOPBIT) {
			    rem <<= 1;
			    rem ^= 0x04C11DB7;
		    } else
			    rem <<= 1;
	    }
//        table[i] = rem;
	    fprintf(arq_tabela, "0x%X, ", rem);
/*        if (i % 100000000 == 0){
            printf("%d\n", i);
        }*/
    }
    fclose(arq_tabela);
    return 0;

}

