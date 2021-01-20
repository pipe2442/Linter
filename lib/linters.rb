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
    puts "\nError - Your code lenght is #{count} -" \
         'The maximum total length of your file should be 100 lines.'
  end

  def counting_lines
    count = total_lines(@file_path)
    total_lines_message(count) if count > 100
  end

  def line_length
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      if line.length > 120
        puts "\nError - The length of line #{j + 1} is #{line.length} - The max single line length is 120"
      end
    end
  end

  def match_brackets
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      puts "\nError - You are missing a bracket ('[]' - '()' - '{}') at line #{j + 1}" unless brackets(line)
    end
  end

  def blank_line
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      puts "\nError - Blank line at the beginning of the script" if line.match(/^\n/) && j.zero?
    end
  end
end
