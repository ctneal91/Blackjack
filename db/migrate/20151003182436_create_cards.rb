class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :position   
      t.string :suit
      t.integer :value
      t.string :name
      t.integer :game_id
      t.integer :hand_id

      t.timestamps null: false
    end
  end
end
