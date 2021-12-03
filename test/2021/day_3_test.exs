defmodule AdventOfCode.Y2021.Day3Test do
  @moduledoc false
  use ExUnit.Case
  @moduletag :y21d03

  @sampleinput "00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010"

  alias AdventOfCode.Y2021.Day3, as: Solution

  describe "most common bits in every column is gamma" do
    test "and gamma for sample input is" do
      gamma =
        @sampleinput
        |> Solution.parse()
        |> Solution.transpose_matrix()
        |> Solution.calculate_gamma()

      assert gamma == "10110"
    end
  end

  describe "least common bits in a row is bit for epsilon" do
    test "for sample input is" do
      epsilon =
        @sampleinput
        |> Solution.parse()
        |> Solution.transpose_matrix()
        |> Solution.calculate_gamma()
        |> Solution.calculate_epsilon()

      assert epsilon == "01001"
    end
  end

  # describe "testing gamma and epsilon value in decimal" do
  #   test "gamma value in decimal should be 22" do

  #   end
  # end

  describe "power calculating" do
      test "the power value should be 198" do
        assert Solution.solve_1(@sampleinput) == 198
      end
  end
end
