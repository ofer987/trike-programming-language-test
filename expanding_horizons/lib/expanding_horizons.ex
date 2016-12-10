defmodule ExpandingHorizons do
  def start(_type, _args) do
    IO.gets("")
    |> String.strip
    |> to_charlist
    |> reverse_print

    Supervisor.start_link [], strategy: :one_for_one
  end

  defp reverse_print([head|tail]) do
    reverse_print([head|tail], [])
  end
  defp reverse_print([], reversed) do
    reversed
    |> to_string
    |> IO.write
  end
  defp reverse_print([head|tail], reversed) do
    reverse_print tail, [head] ++ reversed
  end
end
