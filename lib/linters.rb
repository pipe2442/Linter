
class Processor
  def brackets(line)
    brackets = { '(' => ')', '[' => ']', '{' => '}' }
    opening = brackets.keys
    closing = brackets.values
    control = []
    line.each_char do |char|
      if opening.include? char
        control << char
      elsif closing.include? char
        return false if control.empty?
        return false unless brackets[control.pop].eql? char
      end
    end
    control.empty?
  end

  def total_lines(path)
    count = 0
    File.readlines(path).each { count += 1 }
    count
  end
end

class Linter < Processor
  def initialize(file_path)
    @file_path = file_path
  end

  def total_lines_message(count)
    "\nError - Your code lenght is #{count} -" \
         'The maximum total length of your file should be 100 lines.'
  end

  def counting_lines
    count = total_lines(@file_path)
    return total_lines_message(count) if count > 100
    "\nCongrats - No error with the total lines in your file."
  end

  def line_length
    counter = 0
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      if line.length > 120
        counter += 1
        return "\nError - Length of line #{j + 1} is #{line.length} - The max single line length is 120"
      end
    end
    return "\nCongrats - No error with single lines length." if counter.zero?
  end

  def match_brackets
    counter = 0
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      unless brackets(line)
        puts "\nError - Missing a bracket ('[]' - '()' - '{}') at line #{j + 1}"
        counter += 1
      end
    end
    return "\nCongrats - No error with brackets in your file." if counter.zero?
    return 'Error' unless counter.zero?
  end

  def blank_line
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      return "\nError - Blank line at the beginning of the script" if line.match(/^\n/) && j.zero?
      return "\nCongrats - No blank line at the beginning of the script."
    end
  end
end
