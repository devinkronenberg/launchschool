PROTEINS = {
  'AUG' => 'Methionine',
  'UUU' => 'Phenylalanine',
  'UUC' => 'Phenylalanine',
  'UUA' => 'Leucine',
  'UUG' => 'Leucine',
  'UCU' => 'Serine',
  'UCC' => 'Serine',
  'UCA' => 'Serine',
  'UCG' => 'Serine',
  'UAU' => 'Tyrosine',
  'UAC' => 'Tyrosine',
  'UGU' => 'Cysteine',
  'UGC' => 'Cysteine',
  'UGG' => 'Tryptophan',
  'UAA' => 'STOP',
  'UAG' => 'STOP',
  'UGA' => 'STOP'
}

module Translation
  def self.of_codon(str)
    PROTEINS.fetch(str) { fail InvalidCodonError }
  end

  def self.of_rna(str)
    str
      .scan(/.../)
      .map { |codon| of_codon(codon) }
      .take_while { |protein| protein != 'STOP' }
  end
end

class InvalidCodonError < StandardError
end
