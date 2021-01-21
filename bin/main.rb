#!/usr/bin/env ruby
require_relative '../lib/linters.rb'

linter = Linter.new('../examples/example')

puts "Welcome to this simple Linter.\n" \
     "This linter will check the following mistakes in your code:\n" \
     "1. He will return each line in wich you are missing a bracket.\n" \
     "2. He will return an error if the first line on your file is a blank line.\n" \
     "3. He will return an error if the total lines on your file is bigger than 100.\n" \
     "4. He will return an error if the total lines on a single line is bigger than 120.\n"

linter.match_brackets

puts linter.blank_line
puts linter.counting_lines
puts linter.line_length
