class CreateFavoriteArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_articles do |t|
      t.string :author
      t.string :title
      t.string :year
      t.string :date
      t.string :isbn_issn
      t.string :keywords
      t.string :abstract
      t.string :url
      t.string :doi
      t.string :user_id 
    end
  end
end
