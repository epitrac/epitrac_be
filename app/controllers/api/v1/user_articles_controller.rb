class Api::V1::UserArticlesController < ApplicationController
  def index
    if params[:user_id]
      render json: ArticleSerializer.new(UserArticleFacade.articles(params[:user_id]))
    else
      render json: {error: "cannot find saved articles without a user id"}, status: 404

    end
  end

  def create
    render json: UserArticleSerializer.new(UserArticle.create!(user_article_params)), status: 201
  end

  def destroy
    if UserArticle.exists?(params[:id])
      render json: UserArticle.delete(params[:id])
    else
      render json: {error: "no favorite article exists with that id"}, status: 404
    end
    # if params[:user_id] && params[:article_id]
    #   user_article = UserArticle.where(user_id: params[:user_id], article_id: params[:article_id])
    #   render json: UserArticle.delete(user_article)
    # else
  end

private
  def user_article_params
    params.permit(:user_id, :article_id)
  end
end
