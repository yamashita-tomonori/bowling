#coding: utf-8
require 'rspec'

class Game
  def initialize
    @score = 0
    @throw_num = 0
  end

  def throw(num)
    increment_throw_num
    if @throw_num % 3 == 0
      if @score == 10
        num = num * 2
      end
    end
    @score += num
  end

  def increment_throw_num
    @throw_num += 1
  end

  def score
    @score
  end
end

unless __FILE__ == $0
  describe Game do
    it '一投目1点、2投目2点だったら3ptになる' do
      game = Game.new()

      game.throw(1)
      game.throw(2)

      game.score().should == 3
    end

    it '1フレーム目スペア、2フレーム目1投目5点だったら20ptになる' do
      game = Game.new()

      game.throw(5)
      game.throw(5)

      game.throw(5)
      game.throw(0)

      game.score().should == 20
    end

    it '1フレーム目スペア、2フレーム目0点だったら10ptになる' do
      game = Game.new()

      game.throw(5)
      game.throw(5)

      game.throw(0)
      game.throw(0)

      game.score().should == 10
    end
  end
end





