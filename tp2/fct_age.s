/*
uint32_t age(uint32_t annee_naissance)
{
    uint32_t age;
    age = 2022 - annee_naissance;
    return age;
}
*/

    .text
    .globl age
    /* uint32_t age(uint32_t annee_naissance) */
/* DEBUT DU CONTEXTE
  Fonction :
    age : feuille
  Contexte imposé :
    annee_naissance  : registre a0
    uint32_t age     : pile *(sp+0)
*/
age:
addi sp, sp , -4
sw zero , 0(sp)
age_fin_prologue:
li t0 , 2022
lw t2 , 0(sp)
sub t2 , t0 , a0
sw t2 , 0(sp)
lw a0, 0(sp)
age_debut_epilogue:
	addi sp, sp , 4
        ret