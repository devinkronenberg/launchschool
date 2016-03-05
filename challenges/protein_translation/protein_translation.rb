PROTEINS = {
  'AUG'                => 'Methionine',
  'UUU, UUC'           => 'Phenylalanine',
  'UUA, UUG'           => 'Leucine',
  'UCU, UCC, UCA, UCG' => 'Serine',
  'UAU, UAC'           => 'Tyrosine',
  'UGU, UGC'           => 'Cysteine',
  'UGG'                => 'Tryptophan',
  'UAA, UAG, UGA'      => 'STOP'
}

class Translation
  def self.of_codon(str)
    fail InvalidCodonError if PROTEINS.keys.none? { |codon| codon.match(str) }

    PROTEINS.each do |codon, protein|
      return protein if codon.match(str)
    end
  end

  def self.of_rna(str)
    polypeptide = []
    rna = str

    until rna.empty?
      codon = ''
      protein = ''

      while protein.empty?
        codon << rna.slice!(0..2)

        protein = Translation.of_codon(codon)
      end
      break if protein == 'STOP'

      polypeptide << protein
    end

    polypeptide
  end
end

class InvalidCodonError < StandardError
end
