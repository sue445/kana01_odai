describe Kana01Odai do
  describe "evalex" do
    using RSpec::Parameterized::TableSyntax

    where(:formula, :expected) do
      '4*5+6&7|8'                                              |44
      # '15*5'                                                   |75
      # '15+5'                                                   |20
      # '15&5'                                                   |5
      # '15|5'                                                   |15
      # '30*15*5'                                                |2250
      # '30*15+5'                                                |600
      # '30*15&5'                                                |150
      # '30*15|5'                                                |450
      # '30+15*5'                                                |225
      # '30+15+5'                                                |50
      # '30+15&5'                                                |35
      # '30+15|5'                                                |45
      # '30&15*5'                                                |70
      # '30&15+5'                                                |19
      # '30&15&5'                                                |4
      # '30&15|5'                                                |14
      # '30|15*5'                                                |155
      # '30|15+5'                                                |36
      # '30|15&5'                                                |5
      # '30|15|5'                                                |31
      # '1+2+3+4+5+6+7+8+9+10'                                   |55
      # '1*2*3*4*5*6*7*8*9*10'                                   |3628800
      # '1+2+3+4+5*6+7+8+9+10'                                   |600
      # '1*2*3*4*5+6*7*8*9*10'                                   |1330560
      # '1|2|4|8|16|32|64|128|256|512'                           |1023
      # '2046&2045&2043&2039&2031&2015&1983&1919&1791&1535'      |1024
      # '0+1|7*6'                                                |42
      # '6|4+2&9+4'                                              |10
      # '0&6+1&6|4*2'                                            |0
      # '4|4*7+7+4&9'                                            |56
      # '9&8*2+3*1|2|7'                                          |280
      # '230+83*751&176'                                         |50080
      # '89+62465*94&84'                                         |5254536
      # '668&925+398*562'                                        |599092
      # '15|9+348*302&23&77'                                     |1452
      # '3&3&6|7+3|5*3|2&4*4'                                    |0
      # '7*6|7|7*1&7|7&3&8*3'                                    |0
      # '896+316*209*264&728'                                    |2026464
      # '1844+41*64|7906|66842'                                  |138965970
      # '2&41&6884*69857+68083'                                  |0
      # '2+3*9*3|6|7&0+3+3*6&8'                                  |0
      # '895+400*988|549&237+488'                                |938875
      # '30*48&99036+140&33+75|645'                              |22050
      # '278+2033+53*96*56|3303|3&14'                            |3177216
      # '5380&27|643*2+1888&74+30|16'                            |0
      # '0&3845+6645*4293+78&78*3102|9|3'                        |90127550385
      # '78&44956&67*974|413+13237*5588|54*668'                  |0
      # '500*206+145|167|163|465&668+662+806*681&458'            |123896000
      # '82+14&0*344+34+542916&18*11|844|64*873223|840993'       |23813260003764
      # '374958|6727+53965&53*954&29|6*138572+59|547783&43*8998' |1.21782747565908E+016
    end

    with_them do
      it_is_asserted_by { Kana01Odai.evalex(formula) == expected }
    end
  end

  describe "#parse" do
    it_is_asserted_by{ Kana01Odai.parse("4*5+6&7|8") == [4, "*", 5, "+", 6, "&", 7, "|", 8] }
  end

  describe "#convert_rpn" do
    it_is_asserted_by{ Kana01Odai.convert_rpn("4*5+6&7|8") == [4,    "*", 5, "+", 6, "&", 7, "|", 8] }
  end
end
