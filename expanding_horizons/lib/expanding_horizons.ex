defmodule ExpandingHorizons do
  def start(_type, _args) do
    IO.gets("")
    |> String.strip
    |> to_charlist
    |> reverse_print

    Supervisor.start_link [], strategy: :one_for_one
  end

  defp reverse_print([]), do: :ok
  defp reverse_print([head|tail]) do
    reverse_print tail
    IO.write to_string [head]
  end
end
