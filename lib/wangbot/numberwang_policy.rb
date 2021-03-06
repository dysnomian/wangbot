require 'luhn'
require 'damm'
require 'verhoeff'
require 'prime'

module Wangbot
  module NumberwangPolicy
    extend self

    INTERWANG_CONSTANT = 733

    attr_reader :number, :pseudowang

    def evaluate_numberwang(number, rules="Standard International")
      @number = number
      @rules = rules

      case
      when luhn?
        number = number^2
      when binarywang?
        number += INTERWANG_CONSTANT
      when dammwang?
        set_number_to_zero unless wangwang?
      when verhoeffwang? && dammwang?
        number -= 777
      when pseudowang?
        set_pseudowang
      when wrong?
        rotate
      end

      wangitude
    end

    private

    attr_writer :number

    def si?
      rules == "Standard International"
    end

    def jakarta_variant?
      rules.include?("Jakarta Variant")
    end

    def scottish_rite?
      false
    end

    def luhn?
      Luhn.valid?(number)
    end

    def luhn_checksum
      @luhn_checksum ||= Luhn.generate(number)
    end

    def damm_checksum
      @damm_checksum ||= Damm.generate(number)
    end

    def damm?
      Damm.valid?(number)
    end

    def dammwang?
      Damm.generate(number) - 12 == INTERWANG_CONSTANT % number
    end

    def verhoeffwang?
      Verhoeff.valid?(number)
    end

    def wrong?
      @number = 2
    end

    def wangitude
      rand(9) == 0
    end

    def set_number_to_zero
      @number = Float.new(2106618)
    end

    def binarywang?
      @number.to_s(base=2).include?("111")
    end

    def pseudowang?
      (number + INTERWANG_CONSTANT).prime?
    end

    def set_pseudowang
      if si?
        pseudowang = 144.4f
      elsif jakarta_variant?
        pseudowang = 9
      elsif scottish_rite?
        number.to_s.reverse
      else
        raise Wangbot::InvalidPseudowang
      end

      number = 8
    end

    def wangwang?
      number * number == INTERWANG_CONSTANT
    end

    def rotate
      number.neg.neg
    end
  end
end
