class Api::V1::FavoriteArticlesController < ApplicationController
  # def create 
  #   # @article = ArticleFacade.articles(params[:disease])
  #   # render json: ArticleSerializer.new(@article)
  #   favorite_article = FavoriteArticle.new(ArticleFacade.articles(params[:disease]))

  #   if favorite_article.save 
  #     render json: favorite_article, status: :created 
  #   else 
  #     render json: favorite_article.errors, status: :unprocessable_entity 
  #   end
  # end

  def index 
    # render json: FavoriteArticle.all 
    render json: FavoriteArticleSerializer.new(FavoriteArticle.all)
  end

  # private 

  # def fave_article_params
  #   params.permit(:author,
  #                 :title,
  #                 :year,
  #                 :date,
  #                 :isbn_issn,
  #                 :keywords,
  #                 :abstract,
  #                 :url,
  #                 :doi, 
  #                 :user_id )
  # end
end