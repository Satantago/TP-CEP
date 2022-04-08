/*
uint32_t taille_chaine(const char *chaine)
{
    uint32_t taille = 0;
    while (chaine[taille] != '\0') {
        taille++;
    }
    return taille;
}
*/
    .text
    .globl taille_chaine
/* uint32_t taille_chaine(const char *chaine) */
/* DEBUT DU CONTEXTE
fonction :
      taille_chaine : feuille
contexte :
    taille : registre t0
    chaine : registre a0
 */

taille_chaine:
taille_chaine_fin_prologue: 
/* uint32_t taille = 0; */
li t0, 0
while:
    add t1, t0, a0
    lbu t2, 0(t1)
    beqz t2, taille_chaine_debut_epilogue
    /* taille++; */
    addi t0, t0, 1
    j while
taille_chaine_debut_epilogue:
    mv a0, t0
    ret