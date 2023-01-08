class UserArticleFacade
  def self.articles(user_id)
    articles = UserArticle.where(user_id: user_id).select(:article_id)
    article_record_numbers = articles.map{|article| article[:article_id]}
    # require "pry"; binding.pry
    UserArticleService.articles_by_record(article_record_numbers).map do |article_data|
      # require "pry"; binding.pry
      Article.new(article_data[0])
    end
  end
end
