defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    try do
      result =
        String.graphemes(rna)
        |> Stream.chunk_every(3)
        |> Enum.map(&Enum.join/1)
        |> Enum.map(&translate/1)
        |> Enum.take_while(&(&1 !== "STOP"))

      {:ok, result}
    rescue
      FunctionClauseError -> {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    try do
      {:ok, translate(codon)}
    rescue
      FunctionClauseError -> {:error, "invalid codon"}
    end
  end

  defp translate("UGC"), do: "Cysteine"
  defp translate("UGU"), do: "Cysteine"
  defp translate("UUA"), do: "Leucine"
  defp translate("UUG"), do: "Leucine"
  defp translate("AUG"), do: "Methionine"
  defp translate("UUU"), do: "Phenylalanine"
  defp translate("UUC"), do: "Phenylalanine"
  defp translate("UCU"), do: "Serine"
  defp translate("UCC"), do: "Serine"
  defp translate("UCA"), do: "Serine"
  defp translate("UCG"), do: "Serine"
  defp translate("UGG"), do: "Tryptophan"
  defp translate("UAU"), do: "Tyrosine"
  defp translate("UAC"), do: "Tyrosine"
  defp translate("UAA"), do: "STOP"
  defp translate("UAG"), do: "STOP"
  defp translate("UGA"), do: "STOP"
end
