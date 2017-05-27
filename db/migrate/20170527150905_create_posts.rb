class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :author, foreign_key: true
      t.datetime :published_at

      t.timestamps
    end
  end
end
