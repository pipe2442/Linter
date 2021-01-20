#!/usr/bin/env ruby
require 'readline'
require_relative '../lib/linters.rb'

linter = Linter.new('../lib/example.rb')
linter.find_parenthesis
linter.square_brackets
linter.curly_braces
linter.counting_lines
##linter.empty_space

#
# file = File.open('../lib/example.rb', "r")
# file.each do |i|
#     puts  i
# end
#

# file = File.open('../lib/example.rb', "r")
# file.readlines().each do |i|
#     puts i
# end

# #file = "how are you hello world"
# #p file =~ /hello/ ? "Valid" : "Invalid"

#
# file = IO.readlines('../lib/example.rb')
#
# puts  file[2]
#
#
# file.each do |i|
#    if i == 'como'
#         puts 'verdadero'
#     else
#         puts 'falso'
#     end
# end
