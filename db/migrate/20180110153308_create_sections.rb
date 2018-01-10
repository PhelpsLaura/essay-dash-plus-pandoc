class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :title
      t.text :outline
      t.text :rough_drafting
      t.text :final_draft
      t.references :essay, foreign_key: true

      t.timestamps
    end
  end
end
