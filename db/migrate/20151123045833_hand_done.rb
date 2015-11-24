class HandDone < ActiveRecord::Migration
  def change
    add_column :hands, :done, :boolean, default: false
  end
end
