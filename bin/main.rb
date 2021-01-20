#!/usr/bin/env ruby
require 'readline'
require_relative '../lib/linters.rb'

linter = Linter.new('../lib/example.rb')

linter.counting_lines
linter.line_length
linter.match_brackets
linter.blank_line
