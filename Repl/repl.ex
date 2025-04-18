defmodule Symbologist do
  def e() do
    n()
    r()
  end

  def n() do
    char list[11] = "0123456789";

    int i = 0;
    while(i < 10){
      if (REPL.match(list[i])){
        REPL.nextToken();
        IO.puts(list[i]);
        return;
      }
      i++;
    }

    IO.puts("Error: Operando not valued.");
    exit(1);
  end

  def r() do
    if (REPL.match('+')){
      IO.puts("+");
      REPL.nextToken();
      e();
    } else if(REPL.match('-')){
      IO.puts("-");
      REPL.nextToken();
      e();
    }else if(REPL.match('*')){
      IO.puts("*");
      REPL.nextToken();
      e();
    }else if(REPL.match('/')){
      IO.puts("/");
      REPL.nextToken();
      e();
    }else if (REPL.match('\0')){
      return;
    }

    IO.puts(lockahead);

    IO.puts("Error: caracter inexistent");
    exit(1);
  end
end

defmodule REPL do
  def match(c) do
    if (c == lockahead)
      return 1;
    return 0;
  end

  def nextToken() do
    position++;
    if(operation[position] == ' ' || operation[position] == '\n')
      nextToken();

    if(position < 255)
      lockahead = operation[position];
    else
      lockahead = '\0';
  end
end

char operation[255] = "9+2-5";
int position = 0;
char lockahead = operation[position];

# Variação da Linguagem
#     E -> NR
#     R -> +E | -E | *E | /E | e
#     N -> 0|1|...|9

Symbologist.e()

IO.puts MathUtils.fatorial(5)
