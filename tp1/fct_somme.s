/*
uint32_t somme(void)
{
    uint32_t i;
    uint32_t res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}
*/
    .text
    .globl somme
/* DEBUT DU CONTEXTE
fonction :
     somme  : feuille
contexte :
     parametre_0      : registre a0
     parametre_1      : registre ai; pile *(sp+n)
     variable_locale0 : registre t0
     variable_locale1 : pile *(sp+k)
     ra               : pile *(sp+p)
     variable_globale : memoire [section nom_de_section]
 */
somme:
somme_fin_prologue:
/* A compléter */
    /* uint32_t i; */
    li a0, 1
    /* uint32_t res = 0; */
    li t0, 0
    li t1, 11
    loop: bge a0, t1, endloop
    /* res += i; */
        add t0, t0, a0
        /* i++; */
        addi a0, a0, 1
        j loop
    endloop:
        mv a0, t0

somme_debut_epilogue:
    ret
