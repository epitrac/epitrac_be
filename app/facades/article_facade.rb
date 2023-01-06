class ArticleFacade 
  def self.articles(disease)
    ArticleService.articles_by_disease(disease).map do |article_data|
      Article.new(article_data)
    end
  end
end