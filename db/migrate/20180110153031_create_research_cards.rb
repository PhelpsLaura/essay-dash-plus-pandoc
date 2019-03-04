class CreateResearchCards < ActiveRecord::Migration[5.1]
  def change
    create_table :research_cards do |t|
      t.string :title
      t.text :body
      t.references :essay, foreign_key: true

      t.timestamps
    end
  end
end
