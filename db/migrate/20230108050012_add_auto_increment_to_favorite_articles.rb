class AddAutoIncrementToFavoriteArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :favorite_articles, :id, :int, null: false, unique: true, auto_increment: true
  end
end
