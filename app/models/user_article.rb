class UserArticle < ApplicationRecord
  validates_presence_of :user_id, :article_id
end
