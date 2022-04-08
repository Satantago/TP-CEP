/*
void inverse_liste(struct cellule_t **l)
{
   struct cellule_t *res, *suiv;
   res = NULL;
   while (*l != NULL) {
       suiv = (*l)->suiv;
       (*l)->suiv = res;
       res = *l;
       *l = suiv;
   }
   *l = res;
}
*/
    .text
    .globl inverse_liste
/* void inverse_liste(struct cellule_t **l) */
/* DEBUT DU CONTEXTE
fonction :
     inverse_liste  : feuille
contexte :
     l : registre a0
     res : registre t0
     suiv : registre t2
 */
inverse_liste:
inverse_liste_fin_prologue:
/* res = NULL; */
li t0, 0
while: 
    lw t1, 0(a0)
    beqz t1, inverse_liste_debut_epilogue

    /*  suiv = (*l)->suiv;  */
    lw t2, 4(t1)
    /* (*l)->suiv = res; */
    sw t0, 4(t1)
    /* res = *l; */
    mv t0, t1
    /* *l = suiv; */
    sw t2, 0(a0)
    j while


inverse_liste_debut_epilogue:
    sw t0, 0(a0)
    ret