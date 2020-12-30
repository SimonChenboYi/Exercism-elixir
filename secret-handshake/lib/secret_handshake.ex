defmodule SecretHandshake do
  use Bitwise, only_operators: true
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  
  # This is 2nd solution learnt from community 


  def commands(0), do: []
  def commands(1), do: ["wink"]
  def commands(2), do: ["double blink"]
  def commands(4), do: ["close your eyes"]
  def commands(8), do: ["jump"]

  def commands(code) do
    result = commands(1 &&& code) ++ commands(2 &&& code) ++ commands(4 &&& code) ++ commands(8 &&& code)
    if (16 &&& code) == 16 do
      Enum.reverse(result)
    else
      result
    end
  end
end
