defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.scan(~r/([A-Za-z ])\1{0,}/,string) 
    |> Enum.map(fn x-> [String.length(List.first(x)), List.last(x)] end)
    |> List.flatten
    |> Enum.map_join(fn x-> if x==1, do: "",else: x end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    String.split(string, ~r/()\d+[A-Za-z ]()/, on: [1,2], trim: true) 
    |> Enum.map_join(fn substring -> convert_substring(substring) end)
  end

  defp convert_substring(substring) do
    if Regex.match?(~r/\d/, substring) do
      {number_string,letter} = String.split_at(substring, -1)
      String.duplicate(letter, String.to_integer(number_string))
    else 
      substring
    end
  end

end
