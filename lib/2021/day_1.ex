defmodule AdventOfCode.Y2021.Day1 do
  @moduledoc """
  Problem Link: https://adventofcode.com/2021/day/1
  """
  def run_part1 do
    file_path = Path.join(:code.priv_dir(:advent_of_code), "2021/day_1.txt")
    {:ok, file} = File.read(file_path)

    file
    |> solve_part1()
  end

  def solve_part1(depths) do
    depths
    |> String.split()
    |> Enum.map(&String.to_integer(&1))
    |> find_increment()
  end

  defp find_increment(list) do
    [h | t] = list
    find_increment(h, t, 0)
  end

  defp find_increment(_, [], acc), do: {:ok, acc}

  defp find_increment(h, t, acc) do
    [next | rest] = t

    case next > h do
      true -> find_increment(next, rest, acc + 1)
      _ -> find_increment(next, rest, acc)
    end
  end
end
