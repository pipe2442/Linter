
class Processor
  def brackets(line)
    brackets = { '(' => ')', '[' => ']', '{' => '}' }
    opening = brackets.keys
    closing = brackets.values
    control = []
    line.each_char do |char|
      if opening.include? char
        control << char
      elsif closing.include? char
        return false if control.empty?
        return false unless brackets[control.pop].eql? char
      end
    end
    control.empty?
  end

  def total_lines(path)
    count = 0
    File.readlines(path).each { count += 1 }
    count
  end
end


