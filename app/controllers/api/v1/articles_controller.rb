class Api::V1::ArticlesController < ApplicationController 
  def index 
    if params[:disease]
      render json: ArticleSerializer.new(ArticleFacade.articles(params[:disease]))
    else 
      render json: {error: "cannot return articles without a disease"}, status: 404

    end
  end

  def show 
    if params[:id] && params[:user_id]
      result = render json: ArticleSerializer.new(ArticleFacade.article(params[:id]))
      
      parsed = JSON.parse(result)["data"]["attributes"]
      FavoriteArticle.create!(parsed)
      FavoriteArticle.update(user_id: params[:user_id])
    else 
      render json: {error: "cannot save an article without a user id"}, status: 404

    end
  end


end
