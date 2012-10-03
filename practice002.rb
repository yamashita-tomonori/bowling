#coding: utf-8
require 'rspec'

class Game
  def initialize
    @throw_cnt = 0
    @current_frame = 1
    @frame_score = 0
    @score_array = Array.new()
    @score_sum = 0
  end

  def throw(cnt)
    #投球数
    @throw_cnt += 1

    #スコアを配列に挿入
    @score_array << cnt

    #フレーム数の計算
    if @throw_cnt % 2 == 0
      @current_frame += 1
    end
  end

  def score_sum
    spare_flg = 0
    @score_array.each_slice(2) do |val1, val2|
      @frame_score = val1 + val2
      if spare_flg == 1
        @score_sum += @frame_score + val1
        spare_flg = 0
      else
        @score_sum += @frame_score
      end
      if @frame_score == 10
        spare_flg = 1
      end
    end
    return @score_sum
  end

  def current_frame
    @current_frame
  end

  def score
    score_sum
  end

  def display
    print "現在のフレームは：", @current_frame, "\n"
    print "現在の合計スコアは：", @score_sum, "\n"
  end
end


unless __FILE__ == $0
  describe Game do
    it '一投目1点、2投目2点だったら3ptになる' do
      game = Game.new()

      game.throw(1)
      game.throw(2)

      game.score.should == 3
    end

    it '1フレーム目スペア、2フレーム目1投目5点だったら20ptになる' do
      game = Game.new()

      game.throw(5)
      game.throw(5)

      game.throw(5)
      game.throw(0)

      game.score().should == 20
    end

    it '1投ガーターたったら現在のフレームは1になること' do
      game = Game.new()
      game.throw(0)

      game.current_frame.should == 1
    end

    it '2投ガーターだったら現在のフレームは2になること' do
      game = Game.new()
      game.throw(0)
      game.throw(0)

      game.current_frame.should == 2
    end
  end
end




