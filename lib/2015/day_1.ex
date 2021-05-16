defmodule AdventOfCode.Y2015.Day1 do
  @moduledoc """
  Problem Link: https://adventofcode.com/2015/day/1
  """

  def floor(""), do: {:error, :invalid}
  def floor(" "), do: {:error, :invalid}

  def floor(instructions) when is_binary(instructions) do
    result =
      instructions
      |> String.graphemes()
      |> Enum.reduce_while(0, fn x, acc ->
        case x do
          "(" -> {:cont, acc + 1}
          ")" -> {:cont, acc - 1}
          _ -> {:halt, acc}
        end
      end)

    {:ok, result}
  end
end
