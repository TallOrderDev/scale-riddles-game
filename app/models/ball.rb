class Ball < ActiveRecord::Base
  belongs_to :game
  has_one :scale, through: :game

  before_create :set_default_weight

  def change_weight_9
    self.weight = 1
    self.save
  end

  def change_weight_12
    self.attributes = {weight: [1, -1].sample}
    self.save
  end

  private
    def set_default_weight
      self.weight = 0
    end
end
