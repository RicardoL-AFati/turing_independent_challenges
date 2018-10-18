class BinaryTranslator
  AlPHA_TO_BINARY = {
    A: 1.to_s(2),
    B: 2.to_s(2),
    C: 3.to_s(2),
    D: 4.to_s(2),
    E: 5.to_s(2),
    F: 6.to_s(2),
    G: 7.to_s(2),
    H: 8.to_s(2),
    I: 9.to_s(2),
    J: 10.to_s(2),
    K: 11.to_s(2),
    L: 12.to_s(2),
    M: 13.to_s(2),
    N: 14.to_s(2),
    O: 15.to_s(2),
    P: 16.to_s(2),
    Q: 17.to_s(2),
    R: 18.to_s(2),
    S: 19.to_s(2),
    T: 20.to_s(2),
    U: 21.to_s(2),
    V: 22.to_s(2),
    W: 23.to_s(2),
    X: 24.to_s(2),
    Y: 25.to_s(2),
    Z: 26.to_s(2)
  }

  def translate(string)
    string.chars.reduce("") do |binary_string, char|
      if char == " "
        binary_string += "000000"
      elsif char =~ /[a-z]/i
        in_binary = AlPHA_TO_BINARY[char.upcase.to_sym]
        leading_zeros = "0" * (6 - in_binary.length)
        binary_string += "#{leading_zeros}#{in_binary}"
      end
      binary_string
    end
  end
end
