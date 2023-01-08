class ArticleFacade 
  def self.articles(disease)
    ArticleService.articles_by_disease(disease).map do |article_data|
      Article.new(article_data)
    end
  end

  def self.article(article_id)
    article = ArticleService.one_article(article_id)[0]
    Article.new(article)
  end
end