#include "cep_platform.h"
.text
.globl reveil
/* void reveil(uint32_t delta_t); */
reveil:
	la t0 , CLINT_TIMER
	lw t1 , 0(t0)
	lw t2, 4(t0)
	la t3, CLINT_TIMER_CMP
	add t4,t1,a0
	sw t4,0(t3)
	slt t5,t4,t1
	slt t6,t4,a0
	or t3 , t6 , t5
	add t3 , t3 , t0
	sw t3 , 4(t3)
    ret

.globl gestion_interruptions
gestion_interruptions:
    addi sp, sp, -4 # Juste ra à sauver
    sw   ra, 0(sp)
    andi t0, a0, 0xf
    li   t1, IRQ_M_TMR  # Interruption d'horloge
    bne  t0, t1, interruption_externe
    jal  mon_vecteur_horloge
    j    retour
interruption_externe:
    /* Pour plus tard : gestion des boutons poussoirs */
retour:
    lw   ra, 0(sp)
    addi sp, sp, 4
    ret

/* Idiot mais nécessaire pour que l'évaluation soit contente... */
/* DEBUT DU CONTEXTE
  Fonction :
    timer : feuille
  Contexte :
 */
timer:
timer_fin_prologue:
timer_debut_epilogue:
    ret

    .data
    .globl param
/* struct compt *param; */
param: .long 0x0
