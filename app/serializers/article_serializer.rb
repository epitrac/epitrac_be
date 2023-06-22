class ArticleSerializer 
  include JSONAPI::Serializer 
  attributes  :article_id,
              :author,
              :journal,
              :title,
              :year,
              :date,
              :isbn_issn,
              :keywords,
              :abstract,
              :url,
              :doi
end