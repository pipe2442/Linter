require_relative '../lib/linters.rb'

path = './examples/bad_example'
path2 = './examples/good_example'

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
  let(:linter_good) { Linter.new(path2) }

  describe '#counting_lines' do
    it 'Returns error message if length of file is > 100' do
      expect(linter.counting_lines).to include('Error')
    end
    it 'Returns success message if length of file is < 100' do
      expect(linter_good.counting_lines).to include('Congrats')
    end
  end

  describe '#line_length' do
    it 'Returns error message if length of a single line > 120' do
      expect(linter.line_length).to include('Error')
    end
    it 'Returns success message if length of a single line < 120' do
      expect(linter_good.line_length).to include('Congrats')
    end
  end

  describe '#match_brackets' do
    it 'Returns nil if there is a missing bracket' do
      expect(linter.match_brackets).to include('Error')
    end
    it 'Returns success message if there is no missing bracket' do
      expect(linter_good.match_brackets).to include('Congrats')
    end
  end

  describe '#blank_line' do
    it 'Returns error message if the first script line is blank' do
      expect(linter.blank_line).to include('Error')
    end
    it 'Returns success message if the first script line is not blank' do
      expect(linter_good.blank_line).to include('Congrats')
    end
  end
end
