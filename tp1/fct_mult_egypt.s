    .text
/*
uint32_t x, y;

uint32_t mult_egypt(void)
{
    uint32_t res = 0;
    while (y != 0) {
        if (y % 2 == 1) {
            res = res + x;
        }
        x = x << 1 ;
        y = y >> 1;
    }
    return res;
}
*/
    .globl mult_egypt
/* Attention, res est une variable locale que l'on mettra dans t0 */
/* DEBUT DU CONTEXTE
fonction :
     mult_egypt  : feuille
contexte :
     res : registre t0
     x : memoire
     y : memoire
 */
mult_egypt:
mult_egypt_fin_prologue:
/* A compléter */
    /* uint32_t res = 0; */
    li t0, 0
    lw t1, x
    lw t2, y
    while:
        /* check if y == 0 */
        beqz t2, fin
        /* if (y % 2 == 1) */
        andi t3, t2, 1
        beqz t3, lasuite
        /* res = res + x; */
	    add t0, t0 , t1
	    j lasuite

    lasuite:
        /*  x = x << 1 */
        slli t1,t1,1
        sw t1, x, t5
        /*  y = y >> 1 */
        srli t2 , t2 ,1
        sw t2, y ,t5
        j while


    fin:
        mv a0, t0

mult_egypt_debut_epilogue:
    ret
    .data
    .comm x, 4
    .comm y, 4