class Api::V1::ArticlesController < ApplicationController 
  def index 
    render json: ArticleSerializer.new(ArticleFacade.articles(params[:disease]))
    #if params[:user_id]
      # FavoriteArticle.create(FavoriteArticleSerializer.new())
    #end
  end

  def favorite 
    if params[:user_id]
  end
end
