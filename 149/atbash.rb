class Atbash
  FIRST_13 = %w(a b c d e f g h i j k l m)
  LAST_13  = %w(z y x w v u t s r q p o n)
  NUMS     = %w(0 1 2 3 4 5 6 7 8 9)

  def self.substitute(char)
    if FIRST_13.include?(char)
      return LAST_13[FIRST_13.index(char)]
    elsif LAST_13.include?(char)
      return FIRST_13[LAST_13.index(char)]
    elsif NUMS.include?(char)
      return char
    end
  end

  def self.encode(str)
    cipher = []
    count = 0

    str.downcase.split('').each do |char|
      unless substitute(char).nil?
        cipher << substitute(char)
        count += 1
      end

      if count == 5
        cipher << ' '
        count = 0
      end
    end

    cipher.pop if cipher.last == ' '
    cipher.join('')
  end
end
