class Scale < ActiveRecord::Base
  belongs_to :game
  has_many :balls, through: :games

end
