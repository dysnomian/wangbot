module Wangbot
  module NumberwangDeterminator
    extend self

    def is_it_numberwang?(number)
      Wangbot::NumberwangPolicy(number)
    end
  end
end
