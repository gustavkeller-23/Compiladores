defmodule MathUtils do
  def fatorial(n) do
    Enum.reduce(1..n, 1, fn a, b -> a * b end)
  end
end

IO.puts MathUtils.fatorial(5)  # Saída: 120
