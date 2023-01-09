class UserArticleFacade
  def self.articles(user_id)
    user_articles = UserArticle.where(user_id: user_id).select(:id, :article_id)
    # article_record_numbers = user_articles.map{|article| article[:article_id]}

    UserArticleService.articles_by_record(user_articles).map do |article_data|
      Article.new(article_data[0])
    end
  end
end
