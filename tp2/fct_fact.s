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
     ra         : pile *(sp+4)
     n          : registre a0 ; pile *(sp+0)
 */
fact:
addi sp,sp , -8
sw a0 , 0(sp)
sw ra , 4(sp)
fact_fin_prologue:
li t1, 1
bgt a0, t1 , else
mv a0 , t1
j fact_debut_epilogue
else : addi a0, a0 , -1
jal fact
lw t0 , 0(sp)
mul a0, a0 , t0
fact_debut_epilogue:
lw ra, 4(sp)
addi sp, sp , 8
    ret