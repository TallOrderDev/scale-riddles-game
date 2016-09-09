class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :ball_count
      t.timestamps null: false
  end
end
