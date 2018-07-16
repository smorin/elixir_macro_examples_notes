# elixir_macro_examples_notes
Just some random examples of elixir macros and notes

iex> Minspect.mray hello do
...> IO.puts "one"
...> else
...> IO.puts "the else"
...> printme
...> IO.puts "to print"
...> end

mray/2 called.
first_arg:{:hello, [line: 25], nil}
second_arg:[do: {{:., [line: 26], [{:__aliases__, [line: 26], [:IO]}, :puts]}, [line: 26], ["one"]}, else: {:__block__, [], [{{:., [line: 28], [{:__aliases__, [line: 28], [:IO]}, :puts]}, [line: 28], ["the else"]}, {:printme, [line: 29], nil}, {{:., [line: 30], [{:__aliases__, [line: 30], [:IO]}, :puts]}, [line: 30], ["to print"]}]}]



second_arg:[
    do: {{:., [line: 26], [{:__aliases__, [line: 26], [:IO]}, :puts]}, [line: 26], ["one"]}, 
    else: {:__block__, [], [{{:., [line: 28], [{:__aliases__, [line: 28], [:IO]}, :puts]}, [line: 28], ["the else"]},
     {:printme, [line: 29], nil}, {{:., [line: 30], [{:__aliases__, [line: 30], [:IO]}, :puts]}, [line: 30], ["to print"]}]}
    ]


Minspect.mray hello, do: one, else: wow, printme: yup, warrior: one 

iex> Minspect.mray hello, do: one, else: wow, printme: yup, warrior: one
mray/2 called.
first_arg:{:hello, [line: 26], nil}
second_arg:[do: {:one, [line: 26], nil}, else: {:wow, [line: 26], nil}, printme: {:yup, [line: 26], nil}, warrior: {:one, [line: 26], nil}]

Minspect.mray hello do 
:one
another 
:wow 
printme
:yup
end

iex> Minspect.mray hello do
...> :one
...> another
...> :wow
...> printme
...> :yup
...> end
mray/2 called.
first_arg:{:hello, [line: 27], nil}
second_arg:[do: {:__block__, [], [:one, {:another, [line: 29], nil}, :wow, {:printme, [line: 31], nil}, :yup]}]
nil
iex>

Minspect.mray hello do 
IO.puts "one world"
another 
IO.puts "another world"
printme
IO.puts "last world"
end

iex> Minspect.mray hello do
...> IO.puts "one world"
...> another
...> IO.puts "another world"
...> printme
...> IO.puts "last world"
...> end
mray/2 called.
first_arg:{:hello, [line: 31], nil}
second_arg:[do: {:__block__, [], [{{:., [line: 32], [{:__aliases__, [line: 32],[:IO]}, :puts]}, [line: 32], ["one world"]}, {:another, [line: 33], nil}, {{:.,[line: 34], [{:__aliases__, [line: 34], [:IO]}, :puts]}, [line: 34], ["another world"]}, {:printme, [line: 35], nil}, {{:., [line: 36], [{:__aliases__, [line: 36], [:IO]}, :puts]}, [line: 36], ["last world"]}]}]

quote do
    "StringA" <> " " <> "StringB"
end

# Result
{:<>, [context: Elixir, import: Kernel],
 ["StringA", {:<>, [context: Elixir, import: Kernel], [" ", "StringB"]}]}

quote do
 "#{a} #{b}"
end

# Result
{:<<>>, [],
 [
   {:::, [],
    [
      {{:., [], [Kernel, :to_string]}, [], [{:a, [], Elixir}]},
      {:binary, [], Elixir}
    ]},
   " ",
   {:::, [],
    [
      {{:., [], [Kernel, :to_string]}, [], [{:b, [], Elixir}]},
      {:binary, [], Elixir}
    ]}
 ]}

quote do
Enum.join(["StringA", "StringB"], " ")
end 

# Result
{{:., [], [{:__aliases__, [alias: false], [:Enum]}, :join]}, [],
 [["StringA", "StringB"], " "]}

# using IO List
quote do
["String1", " ", "String2"] |> IO.iodata_to_binary
end

{:|>, [context: Elixir, import: Kernel],
 [
   ["String1", " ", "String2"],
   {{:., [], [{:__aliases__, [alias: false], [:IO]}, :iodata_to_binary]}, [],
    []}
 ]}

Using IO Lists
https://10consulting.com/2016/10/28/elixir-io-lists/
https://www.bignerdranch.com/blog/elixir-and-io-lists-part-1-building-output-efficiently/
https://www.bignerdranch.com/blog/elixir-and-io-lists-part-2-io-lists-in-phoenix/