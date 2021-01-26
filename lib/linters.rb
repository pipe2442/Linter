require_relative 'processor.rb'

class Linter < Processor
  def initialize(file_path)
    @file_path = file_path
  end

  def counting_lines
    count = total_lines(@file_path)
    ("\nError - Metrics/LineLength: Your File is too long [#{count}, 100]" if count > 100) ||
      ("\nCongrats - No error with the total length of your file." if count <= 100)
  end

  def line_length
    message = nil
    no_error = true
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      no_error = false if line.length > 120
      message = "\nError - Metrics/LineLength: Line #{j + 1} is too long [#{line.length + 1}, 120]" if line.length > 120
    end
    message = "\nCongrats - No error with any single line length of your file." if no_error == true
    message
  end

  def match_brackets
    error = []
    message = nil
    counter = 0
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      unless brackets(line)
        error.push("\nError - Missing a bracket ('[]' - '()' - '{}') at line #{j + 1}")
        counter += 1
      end
    end
    message = "\nCongrats - No error with the Brackets in your file." if counter.zero?
    message = error if counter > 0
    message
  end

  def blank_line
    message = nil
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      if line.match(/^\n/) && j.zero?
        message = "\nError - Blank line at the beginning of the script"
      elsif j.zero?
        message = "\nCongrats - No error with blank space at the beginning in your file"
      end
    end
    message
  end
end
