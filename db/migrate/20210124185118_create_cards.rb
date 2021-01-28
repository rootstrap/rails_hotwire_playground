class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.integer :position
      t.belongs_to :column

      t.timestamps
    end
  end
end
