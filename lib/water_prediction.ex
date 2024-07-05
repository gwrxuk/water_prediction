defmodule WaterPrediction do
  def read_csv(file_path) do
    file_path
    |> File.stream!()
    |> WaterLevelParser.parse_stream()
    |> Enum.to_list()
  end

  def read_csv_row_by_row(file_path) do
    file_path
    |> File.stream!()
    |> WaterLevelParser.parse_stream
    |> Stream.map(fn [date, level] ->
      %{date: :binary.copy(date), level: level}
    end)
    |>Stream.run
  end
end
