class FavoriteArticleSerializer 
  include JSONAPI::Serializer 
  attributes :author,
            :title,
            :year,
            :date,
            :isbn_issn,
            :keywords,
            :abstract,
            :url,
            :doi, 
            :user_id,
            :article_id 
end