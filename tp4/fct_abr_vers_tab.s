/*
void abr_vers_tab(struct noeud_t *abr)
{
    if (abr != NULL) {
        abr_vers_tab(abr->fg);
        *ptr = abr->val;
        ptr++;
        struct noeud_t *fd = abr->fd;
        free(abr);
        abr_vers_tab(fd);
    }
}
*/

    .text
    .globl abr_vers_tab
/* DEBUT DU CONTEXTE
fonction :
     abr_vers_tab  : non feuille
contexte :
     abr      : registre a0; pile *(sp+0)
     fd : pile *(sp+4)
     ra               : pile *(sp+8)
     ptr : memoire allouée par abr_vers_tab
 */
abr_vers_tab:
    addi sp, sp, -12
    sw ra, 8(sp)
    sw a0, 0(sp) 
abr_vers_tab_fin_prologue:
    /* if (abr != NULL) */
    beqz a0, abr_vers_tab_debut_epilogue
    /* abr_vers_tab(abr->fg); */
    lw a0, 4(a0)
    jal abr_vers_tab

    /* *ptr = abr->val; */
    lw t3, ptr
    lw t4, 0(sp)
    lw t4, 0(t4)
    sw t4, 0(t3)
    /* on a fait t4 <- abr->val */

    /* ptr++ */
    addi t3, t3, 4
    sw t3, ptr, t5
    /* struct noeud_t *fd = abr->fd; */
    lw t2, 0(sp)
    lw t2, 8(t2)
    sw t2, 4(sp)
    lw a0, 0(sp)
    /* free */
    jal free
    /* abr_vers_tab(fd) */
    lw a0, 4(sp)
    jal abr_vers_tab

abr_vers_tab_debut_epilogue:
    lw ra, 8(sp)
    addi sp, sp,12    
    ret

    .data
    .comm ptr, 4