defmodule AdventOfCode.Y2021.Day3 do
  def run_1, do: load_file() |> solve_1()

  def solve_1(diagnostics) do
    diagnostics
    |> parse()
    |> transpose_matrix()
    |> calculate_power()
  end

  def calculate_power(binary_bits) do
    gamma =
      binary_bits
    |> calculate_gamma()

    epsilon =
    gamma
    |> calculate_epsilon()
    elem(Integer.parse(gamma, 2),0) * elem(Integer.parse(epsilon, 2), 0)
  end

  def calculate_gamma(bits), do: calculate_gamma(bits, "")
  def calculate_gamma([], gamma), do: gamma

  def calculate_gamma(bits, gamma) do
    [head | tail] = bits
    calculate_gamma(tail, gamma <> gamma_bit(head))
  end

  def gamma_bit(bits) do
    if Enum.count(bits, &(&1 == 0)) > Enum.count(bits, &(&1 == 1)), do: "0", else: "1"
  end

  def calculate_epsilon(gamma) do
    gamma
    |> String.graphemes()
    |> Enum.map(&(if &1 == "1", do: "0", else: "1"))
    |> List.to_string()
  end

  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(fn x ->
      for y <- x do
        String.to_integer(y)
      end
    end)
  end

  def transpose_matrix(matrix) do
    matrix
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end



  defp load_file do
    file_path = Path.join(:code.priv_dir(:advent_of_code), "2021/day_3.txt")
    {:ok, file} = File.read(file_path)
    file
  end
end
