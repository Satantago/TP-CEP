/*
void tri_min(int32_t tab[], uint32_t taille)
{
    uint32_t i, j, ix_min;
    int32_t tmp;
    for (i = 0; i < taille - 1; i++) {
        for (ix_min = i, j = i + 1; j < taille; j++) {
            if (tab[j] < tab[ix_min]) {
                ix_min = j;
            }
        }
        tmp = tab[i];
        tab[i] = tab[ix_min];
        tab[ix_min] = tmp;
    }
}
#ENTREE 45
*/
    .text
    .globl tri_min
/* void tri_min(int32_t tab[], uint32_t taille) */
/* DEBUT DU CONTEXTE
fonction :
     tri_min  : feuille 
contexte :
     tab : registre a0
     taille : registre a1
     i : registre t0
     ix_min : registre t3
     j : registre t4
     tmp  : registre a5
*/
tri_min:
tri_min_fin_prologue:
/* uint32_t i = 0; */
    li t0, 0
    addi t1, a1, -1
boucle1:
    /* i < taille; */
    slt t2, t0, t1  
    beqz t2, tri_min_debut_epilogue

    /* ix_min = i; */
    mv t3, t0
    /* j = i + 1; */
    addi t4, t0, 1

boucle2: 
    ble a1, t4, reste_boucle1
    /* on accède à tab[j] et tab[ix_min] */
    slli a2, t4, 2
    add a2, a2, a0
    lw t5, 0(a2)

    slli a3, t3, 2
    add a3, a3, a0
    lw t6, 0(a3)

    /* if tab[j] < tab[ix_min]
        ix_min = j; */
    ble t6, t5, tfaha
    mv t3, t4

 tfaha:
    /* j++ */
    addi t4, t4, 1
    j boucle2

reste_boucle1:
    /* tmp = tab[i]; */
    slli a4, t0, 2
    add a4, a4, a0
    lw a5, 0(a4)

    
    slli a2, t3, 2
    add a2, a2, a0
    lw a6, 0(a2)
    sw a6, 0(a4)
    sw a5, 0(a2)

    
    /* i++; */
    addi t0, t0, 1
    j boucle1


tri_min_debut_epilogue:
    ret
