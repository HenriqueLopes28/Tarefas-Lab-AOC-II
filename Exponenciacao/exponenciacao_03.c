#include <stdio.h>

int powerBase2(int exp, int x){

    if(exp == 0) return x;
    if(exp == 1) return x * 2;
    exp -= 1;
    return x *(2 << exp);
}

int main(){
    int exp, x;

    printf("Digite o x: ");
    scanf("%d", &x);

    printf("Digite o exponencial: ");
    scanf("%d", &exp);

    printf("Resultado: %d", powerBase2(exp, x));
    return 0;
}
