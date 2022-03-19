    .text
/*
uint32_t x, y;

uint32_t mult_simple(void)
{
    res = 0;
    while (y != 0) {
        res = res + x;
        y--;
    }
    return res;
}
*/
    .globl mult_simple
/* DEBUT DU CONTEXTE
fonction :
     mult_simple  : feuille
contexte :
     res : mémoire, allouée par mult_simple
     x : mémoire, allouée par mult_simple
     y : mémoire, allouée par mult_simple
 */
mult_simple:
mult_simple_fin_prologue:
/* A compléter */
    li t0, 0
    li t1, 0
    li t2, 0
    sw t0, x, t3
    sw t1, y, t3
    sw t2, res, t3
while:
    /* check if y == 0 */
    beqz t1, fin
    /* res = res + x; */
    add t2, t2, t0
    sw t2, res, t3
    /* y--; */
    addi t1, t1, -1
    sw t1, y, t3
    j while

fin:
    mv a0, res

mult_simple_debut_epilogue:
    ret

    .data
    .comm res, 4
    .comm x, 4
    .comm y, 4
/* uint32_t res; */
