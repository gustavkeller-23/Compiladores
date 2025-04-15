defmodule ProjetoTest do
  use ExUnit.Case
  doctest Projeto

  test "greets the world" do
    assert Projeto.hello() == :world
  end
end
