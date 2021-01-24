class CreateColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :columns do |t|
      t.string :name, null: false
      t.belongs_to :board

      t.timestamps
    end
  end
end
