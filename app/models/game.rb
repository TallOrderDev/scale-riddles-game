class Game < ActiveRecord::Base
  has_many :scales
  has_many :balls
end
