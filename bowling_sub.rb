#ストライクを考慮に入れている、フレームのスコアなし
#coding: utf-8
require 'rspec'

class Game
  def initialize
    @throw_cnt = 0
    @current_frame = 1
    @frame_score = 0
    @score_array = []
    @score_sum = 0

    @str_cnt = 0
  end

  def throw(cnt)
    #投球数
    @throw_cnt += 1

    #スコアを配列に挿入
    #ストライクだった場合
    if @throw_cnt % 2 == 1 && cnt == 10
      @score_array << cnt
      @score_array << 0
      @throw_cnt += 1
    #ストライクでない場合
    else
      @score_array << cnt
    end

    #フレーム数の計算
    if @throw_cnt % 2 == 0
      @current_frame += 1
    end
  end


  #合計スコアを計算する
  def score_sum
    @current_frame = 0
    is_spare = false
    #フレームごとにスコアを取り出す
    @score_array.each_slice(2) do |val1, val2|

      #ストライクだったならば
      if val1 == 10
        @frame_score[@current_frame] = 0
        @str_cnt += 1
      #ストライクでないならば
      else
        #前のフレームがストライクだった場合
        if str_num != 0
          while @str_num != 0
            @frame_score[@current_frame - @str_num] = 10 * @str_num + val1 + val2
            @str_num -= 1
          end
        #前のフレームがストライクでない場合
        else
          @frame_score[@current_frame] = val1 + val2
        end
      end
      @frame_score = val1 + val2

      #前のフレームがスペアだった場合
      if is_spare
        @frame_score[@current_frame - 1] += val1
        @frame_score[@current_frame] = val1 + val2
        is_spare = false
      #前のフレームがスペアでない場合
      else
        @frame_score[@current_frame] = val1 + val2
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
    print @score_array
  end
end

game = Game.new

game.throw 10
game.throw 1
game.throw 1
game.score
game.display

#unless __FILE__ == $0
#  describe Game do
#    it '一投目1点、2投目2点だったら3ptになる' do
#      game = Game.new
#
#      game.throw 1
#      game.throw 2
#
#      game.score.should == 3
#    end
#
#    it '1フレーム目スペア、2フレーム目1投目5点だったら20ptになる' do
#      game = Game.new
#
#      game.throw 5
#      game.throw 5
#
#      game.throw 5
#      game.throw 0
#
#      game.score.should == 20
#    end
#
#    it '1投ガーターたったら現在のフレームは1になること' do
#      game = Game.new
#      game.throw 0
#
#      game.current_frame.should == 1
#    end
#
#    it '2投ガーターだったら現在のフレームは2になること' do
#      game = Game.new
#      game.throw 0
#      game.throw 0
#
#      game.current_frame.should == 2
#    end
#  end
#end




