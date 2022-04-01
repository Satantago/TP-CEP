    .text
/*
uint32_t x, y;

uint32_t mult_native(void)
{
    return x*y;
}
*/
    .globl mult_native
/* DEBUT DU CONTEXTE
fonction :
     mult_native  : feuille
contexte :
     x : memoire
     y : memoire
 */
mult_native:
mult_native_fin_prologue:
lw t1 , x
lw t2 , y
mul t0 , t1 , t2
mv a0 , t0
mult_native_debut_epilogue:
    ret
    .data
    .comm x , 4
    .comm y , 4