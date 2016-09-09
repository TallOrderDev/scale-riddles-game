class CreateScales < ActiveRecord::Migration
  def change
    create_table :scales do |t|
      t.string :name
      t.integer :count
      t.timestamps null: false
      t.integer :game_id
    end
  end
end
