#coding: utf-8
require 'rspec'

class Game
  def initialize
    @throw_cnt = 0
    @current_frame = 1
    @frame_score = 0
    @score_array = []
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

  #合計スコアを計算する
  def score_sum
    is_spare = false
    #フレームごとにスコアを取り出す
    @score_array.each_slice(2) do |val1, val2|
      @frame_score = val1 + val2

      #前のフレームがスペアだった場合
      if is_spare
        @score_sum += @frame_score + val1
        is_spare = false
      #前のフレームがスペアでない場合
      else
        @score_sum += @frame_score
      end

      #スペアだった場合フラグを立てる
      if @frame_score == 10
        is_spare = true
      end
    end
    @score_sum
  end

  #現在のフレームを返す
  def current_frame
    @current_frame
  end

  #合計スコアを返す
  def score
    score_sum
  end

  #表示メソッド
  def display
    print "現在のフレームは：", @current_frame, "\n"
    print "現在の合計スコアは：", @score_sum, "\n"
  end
end


unless __FILE__ == $0
  describe Game do
    it '一投目1点、2投目2点だったら3ptになる' do
      game = Game.new

      game.throw 1
      game.throw 2

      game.score.should == 3
    end

    it '1フレーム目スペア、2フレーム目1投目5点だったら20ptになる' do
      game = Game.new

      game.throw 5
      game.throw 5

      game.throw 5
      game.throw 0

      game.score.should == 20
    end

    it '1投ガーターたったら現在のフレームは1になること' do
      game = Game.new
      game.throw 0

      game.current_frame.should == 1
    end

    it '2投ガーターだったら現在のフレームは2になること' do
      game = Game.new
      game.throw 0
      game.throw 0

      game.current_frame.should == 2
    end
  end
end




