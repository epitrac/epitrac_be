class ArticleSerializer 
  include JSONAPI::Serializer 
  attributes  :id,
              :author,
              :title,
              :year,
              :date,
              :isbn_issn,
              :keywords,
              :abstract
end