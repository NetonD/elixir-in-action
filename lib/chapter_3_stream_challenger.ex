defmodule StreamChallenger do

  def lines_length!(file_name) do
    file_name
    |> File.stream!()
    |> Stream.map(&String.length/1)
    |> Enum.to_list()
  end

  def longest_line_length!(file_name) do
    file_name
    |> File.stream!()
    |> Enum.reduce("", fn line, last_line ->
      if String.length(line) > String.length(last_line), do: line, else: last_line
    end)
    |> String.length()
  end
end
