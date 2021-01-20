#!/usr/bin/env ruby
require_relative '../lib/linters.rb'

linter = Linter.new('../lib/example.rb')

linter.match_brackets

puts linter.blank_line
puts linter.counting_lines
puts linter.line_length

