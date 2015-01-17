require "kana01_odai/version"

module Kana01Odai
  OPERATOR_PRIPRITIES = {
    "|" => 4,
    "&" => 3,
    "+" => 2,
    "-" => 1,
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
        operator_stack.unshift(element)
      end
    end

    response
  end
end
