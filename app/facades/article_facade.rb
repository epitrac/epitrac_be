class ArticleFacade 
  def self.articles(disease)
    article_data = ArticleService.articles_by_disease(disease)
    # require 'pry'; binding.pry
    if article_data.count <= 4 || article_data == []   
      []
    else 
      article_data.map do |article_data|
        Article.new(article_data)
      end
    end
    
    # article_data.map do |article_data|
    #   Article.new(article_data)
    # end
  end

end