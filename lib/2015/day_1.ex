defmodule AdventOfCode.Y2015.Day1 do
  @moduledoc """
  Problem Link: https://adventofcode.com/2015/day/1
  """

  @spec floor(binary) :: {:error, :invalid} | {:ok, any}
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

  @spec to_basement(binary) :: {:error, :invalid} | {:ok, any}
  def to_basement(""), do: {:error, :invalid}
  def to_basement(" "), do: {:error, :invalid}

  def to_basement(instructions) when is_binary(instructions) do
    pos = 0

    result =
      instructions
      |> String.graphemes()
      |> Enum.reduce_while(0, fn x, acc ->
        cond do
          pos == -1 ->
            {:halt, acc}

          pos > -1 ->
            case x do
              "(" ->
                pos = pos + 1
                {:cont, acc + 1}

              ")" ->
                pos = pos - 1
                {:cont, acc + 1}
            end
        end
      end)

    {:ok, result}
  end
end
