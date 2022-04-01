/*
uint32_t fact(uint32_t n)
{
    if (n <= 1) {
        return 1;
    } else {
        return n * fact(n - 1);
    }
}
*/

    .text
    .globl fact
    /* uint32_t fact(uint32_t n) */
/* DEBUT DU CONTEXTE
fonction :
     fact  : non feuille
contexte :
     n      : registre a0; pile *(sp+0)
     ra               : pile *(sp+4)
 */
fact:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw a0, 0(sp)

/* A compléter */
fact_fin_prologue:
if:
    li t0, 1
    slti t0, a0, 2
    beqz t0, else
    mv a0, t0
    j fact_debut_epilogue
else:
    addi a0, a0, -1
    jal fact
    lw t1, 0(sp)
    mul a0, a0, t1
    j fact_debut_epilogue

fact_debut_epilogue:
    lw ra, 4(sp)
    addi sp, sp, 8
    ret