/*
bool abr_est_present(uint32_t val, struct noeud_t *abr)
{
   if (abr == NULL) {
       return false;
   } else if (val == abr->val) {
       return true;
   } else if (val < abr->val) {
       return abr_est_present(val, abr->fg);
   } else {
       return abr_est_present(val, abr->fd);
   }
}
*/

    .text
    .globl abr_est_present
/* DEBUT DU CONTEXTE
fonction :
     abr_est_present : non feuille
contexte :
     val : registre a0; pile *(sp+0)
     abr : registre a1; pile *(sp+4)
     ra               : pile *(sp+8)
 */
abr_est_present:
    addi sp, sp, -12
    sw ra, 8(sp)
    sw a1, 4(sp)
    sw a0, 0(sp)
abr_est_present_fin_prologue:
    /* donner à a0 la valeur 0 au cas où abr == NULL */
    li a0, 0
    /* if (abr == NULL); */
    beqz a1, abr_est_present_debut_epilogue
    /* abr != NULL alors il faut redonner à a0 sa valeur initiale */
    lw a0, 0(sp)

    /* ------------------------------------------------------------- */


    /* t0 <- abr->value */
    lw t0, 0(a1)
    /* donner à a0 la valeur 1 au cas où abr->val == val*/
    li a0, 1
    /* if val == abr->val   */
    beq a0, t0, abr_est_present_debut_epilogue
    /* abr->val != val alors il faut redonner à a0 sa valeur initiale*/
    lw a0, 0(sp)



    /* -------------------------------------------------------------- */

    /* if val < abr->val */
    slt t1, a0, t0
    beqz t1, else
    /* return abr_est_present(val, abr->fg); */
    lw a1, 4(a1)
    jal abr_est_present
    lw a1, 4(sp)
    j abr_est_present_debut_epilogue





else: /* on refait le même truc */
    lw a1, 8(a1)
    jal abr_est_present
    lw a1, 8(sp)
    j abr_est_present_debut_epilogue

abr_est_present_debut_epilogue:
    lw   ra, 8(sp)
    addi sp, sp,12
    ret
