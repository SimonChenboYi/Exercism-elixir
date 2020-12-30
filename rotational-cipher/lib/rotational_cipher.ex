defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()

  def number_rotate(x, shift)
    when (x in ?A..?Z) and (x+shift in ?A..?Z) 
    when (x in ?a..?z) and (x+shift in ?a..?z) do
      x+shift
  end

  def number_rotate(x, shift)
    when (x in ?A..?Z) and (x+shift > ?Z) 
    when (x in ?a..?z) and (x+shift > ?z) do
      x+shift - 26
  end

  def number_rotate(x, _shift), do: x

  def rotate(text, shift) do
    String.to_charlist(text)
    |>  Enum.map(fn x -> number_rotate(x, shift) end)
    |> to_string
  end
end
