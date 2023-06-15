class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :background
      t.string :color
      t.string :subline
      t.string :title
      t.string :icon

      t.timestamps
    end
  end
end
