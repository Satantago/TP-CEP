/*
uint32_t res;

uint32_t sommeMem(void)
{
    uint32_t i;
    res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}
*/

    .globl sommeMem
/* DEBUT DU CONTEXTE
fonction :
     sommeMem : feuille
contexte :
     i : registre a0
     res : mémoire, allouée par sommeMem
     
 */
sommeMem:
sommeMem_fin_prologue:
/* A compléter */
    /* uint32_t i = 1; */
    li a0, 1
    /* uint32_t res = 0; */
    li t0, 0
    sw t0, res, t3
    li t1, 11
    
    loop: bge a0, t1, endloop
    /* res += i; */
        add t0, t0, a0
        /* i++; */
        sw t0, res, t3
        addi a0, a0, 1
        j loop
    endloop:
        mv a0, t0

sommeMem_debut_epilogue:
    ret

    .data
    .comm res, 4 /* on réserve 4 octets*/
/* uint32_t res;
 la variable globale res étant définie dans ce fichier, il est nécessaire de
 la définir dans la section .data du programme assembleur : par exemple, avec
 la directive .comm vu qu'elle n'est pas initialisée
*/
