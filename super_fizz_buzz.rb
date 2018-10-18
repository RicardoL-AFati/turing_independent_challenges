class SuperFizzBuzz
  SUPER = "Super"
  FIZZ = "Fizz"
  BUZZ = "Buzz"

  def output(number)
    output = ""
    output += SUPER if divisible_by?(7, number)
    output += FIZZ if divisible_by?(3, number)
    output += BUZZ if divisible_by?(5, number)
    output = number.to_s if output.length == 0
    output
  end

  def output_range(start, final)
    range = (start..final).to_a

    range.map {|number| output(number)}
  end

  def divisible_by?(i, number)
    number % i == 0
  end

  def interface
    puts "Super Fizz Buzz a number or a range!"
    puts "Enter a number or two numbers seperated by a space"

    choice = gets.chomp
    number_or_range = choice.split(" ")

    case number_or_range.length
      when 1
        output(number_or_range.first.to_i)
      when 2
        output_range(number_or_range.first.to_i, number_or_range.last.to_i).each do |output|
          puts output
        end
      else
        puts "Invalid Input!"
    end
  end
end
