class FavoriteArticleSerializer 
  include JSONAPI::Serializer 
  attributes :article_id, 
            :user_id,
            :author,
            :title,
            :year,
            :date,
            :isbn_issn,
            :keywords,
            :abstract,
            :url,
            :doi 
end