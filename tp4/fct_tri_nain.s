/*
void tri_nain(int32_t tab[], uint32_t taille)
{
    uint32_t i = 0;
    while(i < taille - 1) {
        if (tab[i] > tab[i+1]) {
            int32_t tmp = tab[i];
            tab[i] = tab[i+1];
            tab[i + 1] = tmp;
            if (i > 0) {
                i = i - 1;
            }
        } else {
            i = i + 1;
        }
    }
}
*/

    .text
/*  void tri_nain(int32_t tab[], uint32_t taille) */
    .globl tri_nain
/* DEBUT DU CONTEXTE
fonction :
     tri_nain  : feuille
contexte :
     tab      : registre a0
     taille      : registre a1
     i : registre t0
     tmp : registre a6
 */
tri_nain:
tri_nain_fin_prologue:
    /* uint32_t i = 0; */
    li t0, 0
    /* t1 <- taille */
    addi t1, a1, -1
    /* while(i < taille - 1) */

while:
    addi t1, a1, -1
    slt t2, t0, t1
    beqz t2, tri_nain_debut_epilogue
    /* accéder à tab[i] et tab[i+1] */ 
    slli t2, t0, 2
    add t2, a0, t2
    lw t3, 0(t2)
    lw t6, 4(t2)
    slt t5, t6, t3


    beqz t5, else
    /* int32_t tmp = tab[i] */
    mv a6, t3
    /*tab[i] = tab[i+1];*/
    sw t6, 0(t2)
    /* tab[i+1] = tmp */
    sw a6, 4(t2)
    /* if i > 0: i-= 1 */
    slt a2, zero, t0
    beqz a2, while
    addi t0, t0, -1
    j while
else:
    addi t0, t0, 1
    j while



tri_nain_debut_epilogue:
    ret
