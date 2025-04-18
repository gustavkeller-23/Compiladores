
public class repl{

    /* Variação da Linguagem 
        E -> NR
        R -> +E | -E | *E | /E | e
        N -> 0|1|...|9
    */

    static class Functions{

        private char lockahead;
        private final String operation = "9+2-5";
        private int position;

        public Functions(){
            position = 0;
            lockahead = operation[position];
        }
        
        char nextToken(){
            position++;
            if(operation[position] == ' ' || operation[position] == '\n')
                nextToken();

            if(position < 255)
                lockahead = operation[position];
            else
                lockahead = '\0';
        }

        public boolean  match(char c){
            return c == lockahead ? true : false;
        }

        
        public void E(){
            N();
            R();
        }

        public void N(){
            String list = "0123456789";

            int i = 0;
            while(i < 10){
                if (match(list[i])){
                    nextToken();
                    System.out.print(list[i]);
                    return;
                }
                i++;
            }

            System.out.print("Error: Operando not valued.");
        }

        public void R(){
            if (match('+')){
                System.out.print("+");
                nextToken();
                E();
            } else if(match('-')){
                System.out.print("-");
                nextToken();
                E();
            }else if(match('*')){
                System.out.print("*");
                nextToken();
                E();
            }else if(match('/')){
                System.out.print("/");
                nextToken();
                E();
            }else if (match('\0')){
                return;
            }else{
                System.out.print("Error: caracter inexistent");
            }
        }
    }

    public static void main(String[] args) {
        Functions repl = new Functions();
        repl.E();
    }
}





