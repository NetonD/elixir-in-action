defmodule StreamChallenger do

  def lines_length!(file_name) do
    file_name
    |> File.stream!()
    |> Stream.map(&String.length/1)
    |> Enum.take_every(1)
  end
end
