class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content
      t.string :category
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
