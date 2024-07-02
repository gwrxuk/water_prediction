defmodule WaterPrediction do
  def read_csv(file_path) do
    file_path
    |> File.stream!()
    |> WaterLevelParser.parse_stream()
    |> Enum.to_list()
  end
end
