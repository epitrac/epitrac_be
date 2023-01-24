class ArticleFacade 
  def self.articles(disease)
    article_data = ArticleService.articles_by_disease(disease)
    if article_data[0] == nil || article_data == []   
      []
    else 
      article_data.map do |article_data|
        Article.new(article_data)
      end
    end
  end
end