class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.text :text
      t.text :excerpt
      t.integer :user_id

      t.timestamps null: false
    end
  end
end