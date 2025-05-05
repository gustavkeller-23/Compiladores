#include <stdio.h>
#include <stdlib.h>

char lockahead;
char operation[255] = "9+2-5";
int position;
int sizeOfInput;

# Variação da Linguagem 
# E -> NR
# R -> +E | -E | *E | /E | e
# N -> 0|1|...|9

char nextToken();
int match(char c);
void E();
void N();
void R();
int calculateSizeOfInput();

int calculateSizeOfInput(){
    int i = 0;
    while (i != EOF && i != '\n')
        i++;
    
    return i;
}

char nextToken(){
    position++;
    if(operation[position] == ' ' || operation[position] == '\n' || operation[position] == '\0')
        nextToken();

    if (position < sizeOfInput)
        lockahead = operation[position];
    else
        lockahead = '\0';
}

int match(char c){
    return c == lockahead ? 1 : 0;
}

void E(){
    N();
    R();
}

void N(){
    char list[11] = "0123456789";

    int i = 0;
    while(i < 10){
        if (match(list[i])){
            nextToken();
            printf("%c", list[i]);
            return;
        }
        i++;
    }

    printf("Error: Operando not valued.");
    exit(1);
}

void R(){
    if (match('+')){
        printf("+");
        nextToken();
        E();
    } else if(match('-')){
        printf("-");
        nextToken();
        E();
    }else if(match('*')){
        printf("*");
        nextToken();
        E();
    }else if(match('/')){
        printf("/");
        nextToken();
        E();
    }else if (match('\0')){
        return;
    } else {
        printf("Error: caracter inexistent");
        exit(1);
    }
}

int main(){
    sizeOfInput = calculateSizeOfInput();
    position = 0;
    lockahead = operation[position];
    
    E();
    
    return 0;
}