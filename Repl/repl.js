const operation = "9+2-5";
let position = 0;
let lockahead = operation[position];

/* Variação da Linguagem 
    E -> NR
    R -> +E | -E | *E | /E | e
    N -> 0|1|...|9
*/

function nextToken(){
    position++;
    if(operation[position] == ' ' || operation[position] == '\n')
        nextToken();

    (position == operation.length) ? lockahead = '\0' : lockahead = operation[position];
}

function match(character){
    return character == lockahead ? 1 : 0;
}

function E(){
    N();
    R();
}

function N(){
    const numbers = "0123456789";

    let i = 0;
    while(i < 10){
        if (match(numbers[i])){
            nextToken();
            console.log(numbers[i]);
            return;
        }
        i++;
    }

    console.log("Error: Operando not valued.");
}

function R(){
    if (match('+')){
        console.log("+");
        nextToken();
        E();
    } else if(match('-')){
        console.log("-");
        nextToken();
        E();
    }else if(match('*')){
        console.log("*");
        nextToken();
        E();
    }else if(match('/')){
        console.log("/");
        nextToken();
        E();
    } else if (match('\0')){
        return;
    } else {
        console.log("Error: caracter inexistent");
    }
}

    
E();