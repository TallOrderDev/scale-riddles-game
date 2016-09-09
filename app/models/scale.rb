class Scale < ActiveRecord::Base
  has_many :balls
  before_create :set_default_count

  private
    def set_default_count
      self.count = 3
    end
end
