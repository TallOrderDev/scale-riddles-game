class Scale < ActiveRecord::Base
  belongs_to :game
  has_many :balls, through: :games

  def weigh(balls_to_weigh)
    compare_sides({left: sum_side_weight(balls_to_weigh[:left]),
     right: sum_side_weight(balls_to_weigh[:right])
    })
  end

  def sum_side_weight(side_array)
    side_array.map(&:weight).inject(:+)
  end

  def compare_sides(summed_sides)
    if summed_sides[:left] > summed_sides[:right]
      '<img class="scale" id="left" src="/scales/scale_left.png">'
    elsif summed_sides[:left] < summed_sides[:right]
      '<img class="scale" id="right" src="/scales/scale_right.png">'
    else
      '<img class="scale" id="even" src="/scales/scale_even.png">'
    end
  end
end
