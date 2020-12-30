defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    factor_three(number)
      |> factor_five(number)
      |> factor_seven(number)
      |> no_factor(number)
  end

  defp factor_three(number) do
    if rem(number, 3)==0, do: "Pling", else: ""
  end
  defp factor_five(string, number) do
    if rem(number, 5)==0, do: Kernel.<>(string, "Plang"), else: string
  end
    defp factor_seven(string, number) do
    if rem(number, 7)==0, do: Kernel.<>(string, "Plong"), else: string
  end
  defp no_factor(string, number) do
    if string == "", do: to_string(number), else: string
  end

end


  # def convert(number) do
  #   str = div_by_three(number) <> div_by_five(number) <> div_by_seven(number)
  #   case String.length(str) do
  #     0 -> "#{number}"
  #     _ -> str
  #   end
  # end

  # defp div_by_three(num), do: if(rem(num, 3) == 0, do: "Pling", else: "")
  # defp div_by_five(num), do: if(rem(num, 5) == 0, do: "Plang", else: "")
  # defp div_by_seven(num), do: if(rem(num, 7) == 0, do: "Plong", else: "")

