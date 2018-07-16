defmodule MacroExamplesTest do
  use ExUnit.Case
  doctest MacroExamples

  test "greets the world" do
    assert MacroExamples.hello() == :world
  end
end
