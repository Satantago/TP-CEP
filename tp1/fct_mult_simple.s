    .text
/*
uint32_t x, y, res;

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
    res : memoire
	x : memoire
	y : memoire
 */
mult_simple:
mult_simple_fin_prologue:
/* A compléter */
    /*uint32_t x, y; */
    lw t0, x
    lw t1, y
    /* initaliser res avec 0 */
    sw zero, res, t3
    li t2, 0

while:
    /* check if y == 0 */
    beqz t1, fin
    /* res = res + x; */
    add t2, t2, t0
    sw t2, res, t3

    /* y--; */
    addi t1, t1, -1
    j while
fin:
    mv a0, t2


mult_simple_debut_epilogue:
    ret

    .data
    /* uint32_t res; */
    .comm res, 4
    .comm x, 4
    .comm y, 4
