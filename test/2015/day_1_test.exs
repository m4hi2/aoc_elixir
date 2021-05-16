defmodule AdventOfCode.Y2015.Day1Test do
  @moduledoc false
  use ExUnit.Case
  @moduletag :y15d01

  alias AdventOfCode.Y2015.Day1, as: Solution

  describe "testing Y2015 Day1 Part 1" do
    test "floor level is returned '0' for even number of both parenthesis" do
      assert Solution.floor("(())") == {:ok, 0}
      assert Solution.floor("()()") == {:ok, 0}
    end

    test "floor level will be greater than '0' if the number of '(' is higher" do
      assert Solution.floor("(((") == {:ok, 3}
      assert Solution.floor("(()(()(") == {:ok, 3}
      assert Solution.floor("))(((((") == {:ok, 3}
    end

    test "floor level will be less than '0' if the number is ')' is higher" do
      assert Solution.floor("())") == {:ok, -1}
      assert Solution.floor("))(") == {:ok, -1}
      assert Solution.floor(")))") == {:ok, -3}
      assert Solution.floor(")())())") == {:ok, -3}
    end

    test "empty input should return an error" do
      assert Solution.floor("") == {:error, :invalid}
      assert Solution.floor(" ") == {:error, :invalid}
    end
  end

  describe "testing Y2015 Day1 Part2" do
    test "single closing parenthesis causes santa to go directly in the basement" do
      assert Solution.to_basement(")") == {:ok, 1}
    end

    test "when the number of ')' is higher it causes santa to go into basement" do
      assert Solution.to_basement("()())") == {:ok, 5}
    end

    test "empty input should return an error" do
      assert Solution.floor("") == {:error, :invalid}
      assert Solution.floor(" ") == {:error, :invalid}
    end
  end
end
