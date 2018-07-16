quote do 1 + 2 end |> IO.puts

defmodule Tracer do
    defmacro trace(expression_ast) do
      string_representation = Macro.to_string(expression_ast)
  
      quote do
        result = unquote(expression_ast)
        Tracer.print(unquote(string_representation), result)
        result
      end
    end
  
    def print(string_representation, result) do
      IO.puts "Result of #{string_representation}: #{inspect result}"
    end
  end

  {:__block__, [],
 [
   {:=, [],
    [{:result, [], Elixir}, {:+, [context: Elixir, import: Kernel], [1, 2]}]},
   {{:., [], [{:__aliases__, [alias: false], [:IO]}, :puts]}, [],
    [
      {:<<>>, [],
       [
         "result: ",
         {:::, [],
          [
            {{:., [], [Kernel, :to_string]}, [], [{:result, [], Elixir}]},
            {:binary, [], Elixir}
          ]},
         " output: ",
         {:::, [],
          [
            {{:., [], [Kernel, :to_string]}, [], [{:output, [], Elixir}]},
            {:binary, [], Elixir}
          ]}
       ]}
    ]},
   {:result, [], Elixir}
 ]}