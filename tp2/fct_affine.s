/*
uint32_t affine(uint32_t a, uint32_t b, uint32_t x)
{
   return mult(x, a) + b;
}
*/

    .text
    .globl affine
    /* uint32_t affine(uint32_t a, uint32_t b, uint32_t x) */
/* DEBUT DU CONTEXTE
fonction :
     affine  : non feuille
contexte :
     a      : registre a0; pile *(sp+0)
     b      : registre a1; pile *(sp+4)
     x      : registre a2; pile *(sp+8)
     ra               : pile *(sp+12)
 */
affine:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw a0, 0(sp)
    sw a1, 4(sp)
    sw a2, 8(sp)

/* A compléter */
affine_fin_prologue:
    lw a0, 8(sp)
    lw a1, 0(sp)
    jal mult
    lw a1, 4(sp)
    add a0, a0, a1
affine_debut_epilogue:
    lw ra, 12(sp)
    addi sp, sp, 16
    ret