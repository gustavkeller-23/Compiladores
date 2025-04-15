#include <stdio.h>
#include <stdlib.h>

char lockahead;
char operation[6] = "9+2-5";
int position;

/* Variação da Linguagem 
    E -> NR
    R -> +E | -E | *E | /E | e
    N -> 0|1|...|9
*/

char nextToken(){
    position++;
    lockahead = operation[position];
}

int match(char c){
    if (c == lockahead)
        return 1;
    return 0;
}

void E(){
    N();
    R();
}

void N(){
    char list[10] = ['0','1','2','3','4',
                     '5','6','7','8','9'];

    while(list){
        int i = 0;
        if (match(list[i]))
            nextToken();
            return;
        i++;
    }

    printf("Error");
    exit(1);
}

void R(){
    if (match('+')){
        E();
    } else if(match('-')){
        E();
    }else if(match('*')){
        E();
    }else if(match('/')){
        E();
    }else if (match('\0')){
        return;
    }

    printf("Error, caracter inexistente");
    exit(1);
}

int main(){
    position = 0;
    lockahead = operation[position];
    
    E();

    return 0;
}