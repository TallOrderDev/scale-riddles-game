class Game < ActiveRecord::Base
  has_one :scale
  has_many :balls

  before_create :set_game_for_12
  after_create :create_everything_12

  # This method does everything for weigh... EVERYTHING!
  def weigh(params)
    count = self.weigh_count
    if count > 1
      lower_weigh_count
      {image: self.scale.weigh(find_balls(params)), count: self.weigh_count}
    elsif count == 1
      lower_weigh_count
      {image: self.scale.weigh(find_balls(params)), count: self.weigh_count,
      gameOver:
        '<h2>Make Your Guess:</h2>
        <form action="/games/end" method="get" >
          <select name="ball">
            <option value="1">1 Ball</option>
            <option value="2">2 Ball</option>
            <option value="3">3 Ball</option>
            <option value="4">4 Ball</option>
            <option value="5">5 Ball</option>
            <option value="6">6 Ball</option>
            <option value="7">7 Ball</option>
            <option value="8">8 Ball</option>
            <option value="9">9 Ball</option>
            <option value="10">10 Ball</option>
            <option value="11">11 Ball</option>
            <option value="12">12 Ball</option>
          </select><br>
          <input type="radio" name="weight" value="heavier" checked> Heavier<br>
          <input type="radio" name="weight" value="lighter"> Lighter<br>
          <input type="submit">
        </form>'
      }
    else
      {gameOver:
        '<h2>Make Your Guess:</h2>
        <form action="/games/end" method="get" >
          <select name="ball">
            <option value="1">1 Ball</option>
            <option value="2">2 Ball</option>
            <option value="3">3 Ball</option>
            <option value="4">4 Ball</option>
            <option value="5">5 Ball</option>
            <option value="6">6 Ball</option>
            <option value="7">7 Ball</option>
            <option value="8">8 Ball</option>
            <option value="9">9 Ball</option>
            <option value="10">10 Ball</option>
            <option value="11">11 Ball</option>
            <option value="12">12 Ball</option>
          </select><br>
          <input type="radio" name="weight" value="heavier" checked> Heavier<br>
          <input type="radio" name="weight" value="lighter"> Lighter<br>
          <input type="submit">
        </form>'
      }
    end
  end

    def lower_weigh_count
      count = self.weigh_count
      if count > 1
        self.update_attribute(:weigh_count, (count - 1))
        self.save
      else
        self.update_attribute(:weigh_count, 0)
        self.save
        return false
      end
    end

    def find_balls(params)
      left = find_side(params[:left])
      right = find_side(params[:right])
      return {left: left, right: right}
    end

    def find_side(side_array)
      side_array.map! do |num|
        self.balls.find_by(number: num)
      end
    end

  # def won_the_game
  #   self.attributes = {succeeded: "true"}
  #   self.save
  # end

  private

    def create_everything_12
      scale = Scale.create(game: self, name: "scale")
      balls = []
      num = 1
      12.times do
        balls << Ball.new(game: self, number: num.to_s)
        num += 1
      end
      balls.map(&:save)
      balls[rand(0..11)].change_weight_12
    end

    def set_game_for_12
      self.weigh_count = 3
      self.ball_count = 12
    end
end
