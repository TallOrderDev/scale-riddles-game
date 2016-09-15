class Game < ActiveRecord::Base
  has_one :scale
  has_many :balls

  before_create :set_game_for_12
  after_create :create_everything_12

  def won_the_game
    self.attributes = {suceeded: "true"}
    self.save
  end

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
