defmodule MathUtils do
  def fatorial(n), do: fatorial(n, 1)

  defp fatorial(0, acc), do: acc
  defp fatorial(n, acc), do: fatorial(n - 1, n * acc)
end

IO.puts MathUtils.fatorial(5)  # Saída: 120
