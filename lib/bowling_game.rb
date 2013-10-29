require 'rubygems'
require 'bundler/setup'

module BowlingGame
  MAX_KNOCKED_DOWN_PINS = 10

  class << self
    def rolls=(array)
      @rolls = array
      @frame = 1
      @total = 0
      @scores_of_frames = {}
    end

    def score
      return @total if @frame > MAX_KNOCKED_DOWN_PINS || @rolls.empty?

      if strike?
        @rolls = @rolls[1..-1]
        prize = @rolls[0..1].inject(:+)
        @total += MAX_KNOCKED_DOWN_PINS + prize
      elsif spare?
        @rolls = @rolls[2..-1]
        prize = @rolls.first.to_i
        @total += MAX_KNOCKED_DOWN_PINS + prize
      else
        @total += @rolls[0..1].inject(:+)
        @rolls = @rolls[2..-1]
      end
      @scores_of_frames[@frame] = @total
      @frame += 1
      score
      @scores_of_frames
    end


    private

    def strike?
      @rolls.first == MAX_KNOCKED_DOWN_PINS
    end

    def spare?
      @rolls[0..1].inject(:+) == MAX_KNOCKED_DOWN_PINS
    end
  end
end