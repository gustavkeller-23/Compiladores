defmodule MathUtils do
  def fatorial(0), do: 1
  def fatorial(n) when n > 0 do
    n * fatorial(n - 1)
  end
end

IO.puts MathUtils.fatorial(5)  # Saída: 120
