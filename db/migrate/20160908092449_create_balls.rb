class CreateBalls < ActiveRecord::Migration
  def change
    create_table :balls do |t|
      t.string :number
      t.integer :weight
      t.integer :game_id
      t.timestamps null: false
    end
  end
end
