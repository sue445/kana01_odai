require "kana01_odai/version"

module Kana01Odai
  OPERATOR_PRIORITIES = {
    "|" => 4,
    "&" => 3,
    "+" => 2,
    "*" => 1,
  }

  def self.evalex(formula)
    array = parse(formula)
    p formula.split(/[|&+*]/)
    0
  end

  def self.parse(formula)
    formula.
      gsub(/([0-9]+)/){ $1 + "," }.
      gsub(/([|&+*])/){ $1 + "," }.
      split(",").
      map{ |str| str =~ /[0-9]+/ ? str.to_i : str }
  end

  # 逆ポーランド記法に変換
  def self.convert_rpn(formula)
    array = parse(formula)
    operator_stack = []
    response = []

    array.each do |element|
      if element.is_a? Numeric
        response << element
      else
        if operator_stack.empty? || OPERATOR_PRIORITIES[element] > OPERATOR_PRIORITIES[operator_stack.first]
          # スタックの先頭より優先度が高い時はそのまま積む
          operator_stack.unshift(element)
        else
          # スタックの先頭より優先度が低くなるまで取り出してから積む
          until OPERATOR_PRIORITIES[element] > OPERATOR_PRIORITIES[operator_stack.first]
            response << operator_stack.shift
          end
          operator_stack.unshift(element)
        end
      end
    end

    # 残りを全部取り出す
    response << operator_stack.shift until operator_stack.empty?

    response
  end
end
