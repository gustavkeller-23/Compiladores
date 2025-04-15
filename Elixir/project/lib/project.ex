defmodule FatorialCSV do
  require CSV

  def fatorial(n), do: Enum.reduce(1..n, 1, fn a, b -> a * b end)

  def salvar_em_csv(numero) do
    fatorial = fatorial(numero)
    conteudo = [["Fatorial"], [fatorial]]
    |> CSV.encode()
    |> Enum.to_list()
    |> Enum.join("")

    File.write("fatorial.csv", conteudo)
    IO.puts("Resultado salvo em fatorial.csv")
  end
end

# Exemplo de uso
FatorialCSV.salvar_em_csv(5)


