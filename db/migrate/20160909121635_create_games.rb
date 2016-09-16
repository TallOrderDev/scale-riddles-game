class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer  :weigh_count
      t.integer  :ball_count
      t.string   :succeeded
      t.timestamps null: false
    end
  end
end
