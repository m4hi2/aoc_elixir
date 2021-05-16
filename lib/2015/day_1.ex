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
    result =
      instructions
      |> String.graphemes()
      |> Enum.reduce_while(%{cur: 0, pos: 0}, fn x, acc ->
        cond do
          acc.cur == -1 ->
            {:halt, acc}

          acc.cur > -1 ->
            case x do
              "(" ->
                pos = acc.pos + 1
                cur = acc.cur + 1
                acc = %{acc | pos: pos, cur: cur}
                {:cont, acc}

              ")" ->
                pos = acc.pos + 1
                cur = acc.cur - 1
                acc = %{acc | pos: pos, cur: cur}
                {:cont, acc}
            end
        end
      end)

    {:ok, result.pos}
  end
end
