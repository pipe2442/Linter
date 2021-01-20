#!/usr/bin/env ruby
require_relative '../lib/linters.rb'

linter = Linter.new('../lib/example.rb')

linter.blank_line
linter.counting_lines
linter.line_length
linter.match_brackets
