defmodule AdventOfCode.Y2021.Day2Test do
  @moduledoc false
  use ExUnit.Case
  @moduletag :y21d02

  @sampleinput "forward 5
down 5
forward 8
up 3
down 8
forward 2"

  alias AdventOfCode.Y2021.Day2, as: Solution

  describe "problem example should get solved to " do
    test "150" do
      assert Solution.solve_1(@sampleinput) == 150
    end
  end

end
