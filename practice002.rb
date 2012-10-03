#coding: utf-8
require 'rspec'

class Game
  def initialize
    @throw_cnt = 0
    @score_array = Array.new()
    @current_frame = 1
    @score = 0
  end

  def throw(cnt)
    increment_throw_cnt()
    @score_array << cnt
    if @throw_cnt % 2 == 0
      @current_frame += 1
    end
  end

  def increment_throw_cnt
    @throw_cnt += 1
  end

  def score
    @score_array.each do |value|
      @score += value
  def current_frame
    @current_frame
  end
end
end


  def score
    @score
  end
end

game = Game.new()
game.throw(2)
game.throw(3)

game.score


#unless __FILE__ == $0
#  describe Game do
#    it '一投目1点、2投目2点だったら3ptになる' do
#      game = Game.new()
#
#      game.throw(1)
#      game.throw(2)
#
#      game.score().should == 3
#    end
#
#    it '1フレーム目スペア、2フレーム目1投目5点だったら20ptになる' do
#      game = Game.new()
#
#      game.throw(5)
#      game.throw(5)
#
#      game.throw(5)
#      game.throw(0)
#
#      game.score().should == 20
#    end
#
#    it '1投ガーターたったら現在のフレームは1になること' do
#      game = Game.new()
#      game.throw(0)
#
#      game.current_frame.should == 1
#    end
#
#    it '2投ガーターだったら現在のフレームは2になること' do
#      game = Game.new()
#      game.throw(0)
#      game.throw(0)
#
#      game.current_frame.should == 1
#    end
#  end
#end





