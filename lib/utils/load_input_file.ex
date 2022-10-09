defmodule Utils.LoadInputFile do
  @spec load_input(binary) :: binary
  def load_input(filename) do
    file_path = Path.join(:code.priv_dir(:advent_of_code), filename)
    {:ok, file} = File.read(file_path)
    file
  end
end
