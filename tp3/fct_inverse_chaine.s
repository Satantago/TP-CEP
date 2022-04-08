/*
void inverse_chaine(char *ptr, uint32_t taille)
{
    char tmp;
    int32_t dep = taille - 1;
    while (dep > 0) {
        tmp = *ptr;
        *ptr = ptr[dep];
        ptr[dep] = tmp;
        dep = dep - 2;
        ptr++;
    }
}
*/
    .text
    .globl inverse_chaine
/*void inverse_chaine(char *ptr, uint32_t taille) */
/* DEBUT DU CONTEXTE
  Fonction :
    inverse_chaine : feuille
  Contexte :
    ptr     : registre a0, paramètre de type (char *)
    taille  : registre a1, paramètre de type (uint32_t)
    tmp     : registre t0, variable locale de type (char)
    dep     : registre t1, variable locale de type (int32_t)
 */
inverse_chaine:
inverse_chaine_fin_prologue:
  /*     int32_t dep = taille - 1; */
  addi t1, a1, -1

while:
  /* while (dep > 0) */
  slt t2, zero, t1
  beqz t2, inverse_chaine_debut_epilogue
  /* tmp = *ptr; */
  /* ici on stocke le premier caractère non swappé de la moitié gauche de la chaîne */
  lbu t0, 0(a0)
  /* t3 <- adresse du dernier caractère non swappé de la moitié droite de la chaîne */
  add t3, t1, a0
  /* *ptr = ptr[dep]; */
  lbu t4, 0(t3)
  sb t4, 0(a0)
  /* ptr[dep] = tmp; */
  sb t0, 0(t3)
  /*dep = dep - 2;*/
  addi t1, t1, -2
  /*ptr++*/
  addi a0, a0, 1
  j while

inverse_chaine_debut_epilogue:
    ret