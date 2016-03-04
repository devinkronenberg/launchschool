class Octal
  def initialize(str)
    @digits = (str =~ /[^0-7]/) ? [0] : str.split('').map(&:to_i)
  end

  def to_decimal
    decimal = 0

    @digits.reverse.each_with_index do |digit, idx|
      decimal += digit * 8**idx
    end

    decimal
  end
end
