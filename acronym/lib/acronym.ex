defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/^\w|[\s_-][[:alpha:]]|[[:lower:]][[:upper:]]/, string)
    |> List.flatten
    |> Enum.map_join(&String.last/1)
    |> String.upcase
  end
end
