#coding: utf-8
require 'rspec'

class Game
  def initialize
    @throw_cnt = 0
    @score = Array.new(3) do
      [0, 0]
    end
    @frame_score = Array.new
    @score_sum = 0

    input_score()
  end

  def input_score
    for i in 0..2
      for j in 0..1
        print i + 1, "フレーム目", j + 1 , "投目のスコアを入力してください："
        @score[i][j] = gets.to_i
      end
    end
    score()
  end

  def score
    for i in 0..2
      if @score[i][0] + @score[i][1] == 10
        @frame_score[i] = 10 + @score[i+1][0]
      else
        @frame_score[i] = @score[i][0] + @score[i][1]
      end
      print i + 1, "フレーム目のスコア：", @frame_score[i], "\n"
      @score_sum += @frame_score[i]
    end
    print "合計スコア：", @score_sum, "\n"
  end
end

game = Game.new()

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
#    it '1フレーム目スペア、2フレーム目0点だったら10ptになる' do
#      game = Game.new()
#
#      game.throw(5)
#      game.throw(5)
#
#      game.throw(0)
#      game.throw(0)
#
#      game.score().should == 10
#    end
#  end
#end





