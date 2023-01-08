class FavoriteArticle < ApplicationRecord
  validates_presence_of :author,
            :title,
            :year,
            :date,
            :isbn_issn,
            :keywords,
            :abstract,
            :url,
            :doi,
            :article_id 
end