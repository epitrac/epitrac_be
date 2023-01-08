class Api::V1::UserArticlesController < ApplicationController
  def index
    render json: ArticleSerializer.new(UserArticleFacade.articles(params[:user_id]))
  end
  def create
    render json: UserArticleSerializer.new(UserArticle.create!(user_article_params)), status: 201
  end
  def destroy
    user_article = UserArticle.where(user_id: params[:user_id], article_id: params[:article_id])
    render json: UserArticle.delete(user_article)
  end

private
  def user_article_params
    params.permit(:user_id, :article_id)
  end
end
