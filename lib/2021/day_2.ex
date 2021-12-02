defmodule AdventOfCode.Y2021.Day2 do
  @moduledoc """
  Problem Link: https://adventofcode.com/2021/day/2
  """

  def solve_1(commands) do
    commands
    |> process_input()
    |> calc_pos()
  end

  def process_input(input) do
    input
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [command, value] -> [command, String.to_integer(value)] end)
  end

  def calc_pos(commands) when is_list(commands), do: calc_pos(commands, 0, 0)
  def calc_pos([], depth, h_pos), do: depth * h_pos
  def calc_pos([["forward", n] | tail], depth, h_pos), do: calc_pos(tail, depth, h_pos + n)
  def calc_pos([["up", n] | tail], depth, h_pos), do: calc_pos(tail, depth - n, h_pos)
  def calc_pos([["down", n] | tail], depth, h_pos), do: calc_pos(tail, depth + n, h_pos)
end
