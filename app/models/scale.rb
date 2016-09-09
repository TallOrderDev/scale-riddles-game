class Scale < ActiveRecord::Base
  belongs_to :games
  before_create :set_default_count

  private
    def set_default_count
      self.count = 3
    end
end
