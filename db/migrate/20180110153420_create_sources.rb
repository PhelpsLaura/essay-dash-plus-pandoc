class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :citation
      t.text :notes
      t.string :url
      t.references :essay, foreign_key: true

      t.timestamps
    end
  end
end
