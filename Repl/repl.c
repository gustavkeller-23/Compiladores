#include <stdio.h>
#include <stdlib.h>
#include <string.h>


char lockahead;  // Valor do Token
char operation[255]; // Operação completa
double value;   // valor final da operação
int position;   // posição do token
int sizeOfInput;  // Tamanho da operação
double *val;

typedef struct ent{ // lista de variaveis 
    char var[20];
    double value;
    struct ent *prox;
}ent;

ent *list = NULL;
ent *aux;

/* Variação da Linguagem 
    E -> NR
    O -> VI | E
    V -> var
    I -> =
    R -> +E | -E | *E | /E | e
    N -> 0|1|...|9
*/


void nextToken();
int match(char c);
double conversorATOI(char c);
void O();
void V();
double E();
double N();
void R();
int calculateSizeOfInput();
ent *addList();
void buscarList(char string[]);

int calculateSizeOfInput(){
    int i = 0;
    while (i != EOF && i != '\n')
        i++;
    return i;
} 


void nextToken(){
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


double conversorATOI(char c){
    int a = c - '0';
    return a;
}


void O(){

    if (conversorATOI(operation[position]) * 0 == 0) { N(); return; }

    V();
    E();

}


void V(){

    int equalPosition = 0;

    if (operation[position] == ' ') { nextToken(); equalPosition++; }
    
    for (int i = position; operation[i] != '='; i++){
        
        if(operation[i] == "\n"){
            printf("Error: variable is not defined");
            exit(1);
        }

        equalPosition++;
    }
    
    if (list == NULL){
        list = addList();
    } else {
        buscarItem();
    }
    
}


double E(){
    double b = N(); // 9 | 2
    R(); 
    return b;
}


double N(){
    char list[11] = "0123456789";

    int i = 0;
    while(i < 10){
        if (match(list[i])){
            nextToken();

            if (value == -666){
                value = conversorATOI(list[i]);
            }
            return conversorATOI(list[i]);
        }
        i++;
    }

    printf("Error: Operando not valued.");
    exit(1);
}


void R(){

    switch (lockahead){

        case '+': nextToken(); value += E(); break;
        case '-': nextToken(); value -= E(); break;
        case '*': nextToken(); value *= E(); break;
        case '/': nextToken(); value /= E(); break;
        case '\0': break;

    default:

        printf("\nError: caracter inexistent");
        exit(1);
    
    }

}


ent *addList(char string[]) {
    ent* new = (ent *) malloc(sizeof(ent));
    new->value = 0;
    new->prox = list;
    strcpy(new->var, string);
    return new;
}


void buscaList(char string[]){
    ent *local;
    for (local = list ; local != NULL ; local = local->prox){
        if(strcmp(string, local->var)){
            aux = local;
            return;
        }
    }
    
}


int main(){

    do {

        value = -666;
        scanf("%s", &operation);

        position = 0;
        lockahead = operation[position];

        if ( !(match('`')) ) {
            sizeOfInput = calculateSizeOfInput();
            E();
            printf("%g\n", value);
        }

    } while (!match('`')) ;
    
    return 0;
}