defmodule AdventOfCode.Y2015.Day1 do
  @moduledoc """
  Problem Link: https://adventofcode.com/2015/day/1
  """

  def floor(""), do: {:error, :invalid}
  def floor(" "), do: {:error, :invalid}

  def floor(instructions) do
    {:ok, do_floor(instructions, 0)}
  end

  defp do_floor("", cur), do: cur
  defp do_floor("(" <> rst, cur), do: do_floor(rst, cur + 1)
  defp do_floor(")" <> rst, cur), do: do_floor(rst, cur - 1)
end
