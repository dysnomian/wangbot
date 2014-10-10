module Wangbot
  class Player

    attr_reader :name, :score

    def initialize(name)
      @name  = name
      @score = Wangbot::Score.new
    end
  end
end
