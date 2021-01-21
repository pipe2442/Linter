#!/usr/bin/env ruby
require_relative '../lib/linters.rb'

linter_bad = Linter.new('../examples/bad_example')
linter_good = Linter.new('../examples/good_example')

puts "\nWelcome to this simple Linter.\n" \
     "\nThis linter will check the following mistakes in your code:\n" \
     "1. He will return each line in wich you are missing a bracket.\n" \
     "2. He will return an error if the first line on your file is a blank line.\n" \
     "3. He will return an error if the total lines on your file are bigger than 100.\n" \
     "4. He will return an error if the total lines on a single line are bigger than 120.\n"

puts "\n\nHere you will see the results of a script with errors: \n"
linter_bad.match_brackets
puts linter_bad.line_length
puts linter_bad.blank_line
puts linter_bad.counting_lines

puts "\n\nHere you will see the results of a script with NO errors: \n"
puts linter_good.match_brackets
puts linter_good.line_length
puts linter_good.blank_line
puts linter_good.counting_lines
