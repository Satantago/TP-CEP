/*
void hello(void)
{
	affiche_HelloWorld();
}
*/

    .text
    .globl hello
    /* void hello(void) */
/*
  Pas de paramètre, Pas de variable locale.
  ra doit être sauvegardé dans la pile pour ne pas être écrasé lors de l'appel de fonction.

DEBUT DU CONTEXTE
  Fonction :
    hello : non feuille
  Contexte :
    ra  : pile *(sp+0)
*/
hello:
addi sp, sp , -4
sw ra, 0(sp)
hello_fin_prologue:
jal affiche_HelloWorld
lw ra, 0(sp)
hello_debut_epilogue:
	addi sp , sp , 4 
    	ret