defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def replace_nucleotide(?G), do: ?C
  def replace_nucleotide(?C), do: ?G
  def replace_nucleotide(?T), do: ?A
  def replace_nucleotide(?A), do: ?U

  def to_rna(dna) do
    Enum.map(dna, fn x -> replace_nucleotide(x) end)
  end
end
