require_relative 'processor.rb'

class Linter < Processor
  def initialize(file_path)
    @file_path = file_path
    @message = Messages.new
  end

  def counting_lines
    count = total_lines(@file_path)
    @message.total_lines_message(count) if count > 100
    @message.total_lines_success if count <= 100
  end

  def line_length
    counter = 0
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      if line.length > 120
        counter += 1
        @message.line_length_error(line, j)
      end
    end
    @message.line_length_success if counter.zero?
  end

  def match_brackets
    counter = 0
    file = File.readlines(@file_path)
    file.each_with_index do |line, j|
      unless brackets(line)
        @message.brackets_error(j)
        counter += 1
      end
    end
    @message.brackets_success if counter.zero?
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
