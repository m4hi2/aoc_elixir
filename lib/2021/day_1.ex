defmodule AdventOfCode.Y2021.Day1 do
  @moduledoc """
  Problem Link: https://adventofcode.com/2021/day/1
  """
  def run_part1, do: laod_file() |> solve_part1()

  def run_part2, do: laod_file() |> solve_part2()

  def solve_part1(depths) do
    depths
    |> input_formatting()
    |> find_increment()
  end

  def solve_part2(depths) do
    depths
    |> input_formatting()
    |> get_sum_of_3()
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

  defp get_sum_of_3(depths) do
    depths
    |> Enum.chunk_every(3, 1)
    |> Enum.map(&Enum.sum/1)
  end

  defp laod_file do
    file_path = Path.join(:code.priv_dir(:advent_of_code), "2021/day_1.txt")
    {:ok, file} = File.read(file_path)
    file
  end

  defp input_formatting(input) do
    input
    |> String.split()
    |> Enum.map(&String.to_integer(&1))
  end
end
