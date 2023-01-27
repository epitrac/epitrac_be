class Api::V1::ArticlesController < ApplicationController
  def index
    if params[:disease]
      render json: ArticleSerializer.new(ArticleFacade.articles(params[:disease]))
    else 
      render json: {error: "cannot return articles without a disease"}, status: 404
    end
  end

  def destroy 
    articles = UserArticle.where(user_id: params[:id])
    if articles != []
      UserArticle.delete(articles) 
      render json: {message: "All articles were deleted for this user"}
    else 
      render json: {message: "There are no saved articles for this user"}, status: 404
    end
  end
end
