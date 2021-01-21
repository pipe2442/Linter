require_relative '../lib/linters.rb'

path = './examples/example'

describe Processor do
  let(:processor) { Processor.new }
  let(:linter) { Linter.new(path) }

  describe '#brackets' do
    it 'Returns the true there is no missing bracket' do
      expect(processor.brackets(path)).to be true
    end
  end

  describe '#total_lines' do
    it 'Returns the total number of lines on a file' do
      expect(processor.total_lines(path)).to be >= 0
    end
  end
end

describe Linter do
  let(:linter) { Linter.new(path) }

  describe '#counting_lines' do
    it 'Returns error message if length of file is > 100' do
      expect(linter.line_length).to include('Error')
    end
  end

  describe '#line_length' do
    it 'Returns error message if length of a single line' do
      expect(linter.line_length).to include('Error')
    end
  end

  describe '#match_brackets' do
    it 'Returns error message if there is a missing bracket' do
      expect(linter.line_length).to include('Error')
    end
  end

  describe '#blank_line' do
    it 'Returns error message if the first script line is blank' do
      expect(linter.line_length).to include('Error')
    end
  end
end
