class BinaryTranslator
  ALPHA_TO_BINARY = {
    A: "0" * (6 - (1.to_s(2)).length) + 1.to_s(2),
    B: "0" * (6 - (2.to_s(2)).length) + 2.to_s(2),
    C: "0" * (6 - (3.to_s(2)).length) + 3.to_s(2),
    D: "0" * (6 - (4.to_s(2)).length) + 4.to_s(2),
    E: "0" * (6 - (5.to_s(2)).length) + 5.to_s(2),
    F: "0" * (6 - (6.to_s(2)).length) + 6.to_s(2),
    G: "0" * (6 - (7.to_s(2)).length) + 7.to_s(2),
    H: "0" * (6 - (8.to_s(2)).length) + 8.to_s(2),
    I: "0" * (6 - (9.to_s(2)).length) + 9.to_s(2),
    J: "0" * (6 - (10.to_s(2)).length) + 10.to_s(2),
    K: "0" * (6 - (11.to_s(2)).length) + 11.to_s(2),
    L: "0" * (6 - (12.to_s(2)).length) + 12.to_s(2),
    M: "0" * (6 - (13.to_s(2)).length) + 13.to_s(2),
    N: "0" * (6 - (14.to_s(2)).length) + 14.to_s(2),
    O: "0" * (6 - (15.to_s(2)).length) + 15.to_s(2),
    P: "0" * (6 - (16.to_s(2)).length) + 16.to_s(2),
    Q: "0" * (6 - (17.to_s(2)).length) + 17.to_s(2),
    R: "0" * (6 - (18.to_s(2)).length) + 18.to_s(2),
    S: "0" * (6 - (19.to_s(2)).length) + 19.to_s(2),
    T: "0" * (6 - (20.to_s(2)).length) + 20.to_s(2),
    U: "0" * (6 - (21.to_s(2)).length) + 21.to_s(2),
    V: "0" * (6 - (22.to_s(2)).length) + 22.to_s(2),
    W: "0" * (6 - (23.to_s(2)).length) + 23.to_s(2),
    X: "0" * (6 - (24.to_s(2)).length) + 24.to_s(2),
    Y: "0" * (6 - (25.to_s(2)).length) + 25.to_s(2),
    Z: "0" * (6 - (26.to_s(2)).length) + 26.to_s(2),
    " ": "000000"
  }

  def translate(string)
    string.chars.reduce("") do |binary_string, char|
      # require 'pry'; binding.pry
      binary_string += ALPHA_TO_BINARY[char.to_sym] if char == " "
      binary_string += ALPHA_TO_BINARY[char.upcase.to_sym] if char =~ /[a-z]/i
      binary_string
    end
  end

  def translate_to_text(binary_string)
    binary_numbers = binary_string.chars

    final_text = ""
    until binary_numbers.empty?
      binary_char = binary_numbers.slice!(0, 6).join
      final_text += ALPHA_TO_BINARY.key(binary_char).to_s.downcase
    end
    final_text
  end
end
