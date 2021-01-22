require_relative 'processor.rb'

class Linter < Processor
    def initialize(file_path)
      @file_path = file_path
      @message = Messages.new
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
        if line.match(/^\n/) && j.zero?
          @message.blank_error_message
        elsif j.zero?
          @message.blank_success_message
        end
      end
    end
    
  end