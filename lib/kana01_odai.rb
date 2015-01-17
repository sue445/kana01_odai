require "kana01_odai/version"

module Kana01Odai
  def self.evalex(formula)
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
end
