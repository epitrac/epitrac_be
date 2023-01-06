class FavoriteArticle < ApplicationRecord
  validates :author,
            :title,
            :year,
            :date,
            :isbn_issn,
            :keywords,
            :abstract,
            :url,
            :doi 
            :user_id 
end