class Api::V1::ArticlesController < ApplicationController 
  def index 
    @article = ArticleFacade.articles(params[:disease])
    render json: ArticleSerializer.new(@article)

  end

  def show 
    result = render json: ArticleSerializer.new(ArticleFacade.article(params[:id]))
    
    parsed = JSON.parse(result)["data"]["attributes"]
    FavoriteArticle.create!(parsed)
    FavoriteArticle.update(user_id: params[:user_id])

  end


end
