class CreateEssays < ActiveRecord::Migration[5.1]
  def change
    create_table :essays do |t|
      t.string :title
      t.date :due_date
      t.text :prompt
      t.text :thesis

      t.timestamps
    end
  end
end
