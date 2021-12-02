defmodule AdventOfCode.Y2021.Day1Test do
  @moduledoc false
  use ExUnit.Case
  @moduletag :y21d01

  alias AdventOfCode.Y2021.Day1, as: Solution

  @sample_input "199
200
208
210
200
207
240
269
260
263"

  describe "exapme provided in the aoc listing should" do
    test "increased by 7" do
      assert Solution.solve_part1(@sample_input) == {:ok, 7}
    end

    test "increased by 5" do
      assert Solution.solve_part2(@sample_input) == {:ok, 5}
    end
  end
end
