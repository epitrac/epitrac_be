class UserArticleSerializer
  include JSONAPI::Serializer
  attributes  :user_id,
              :article_id
end
