class Api::V1::FavoriteArticlesController < ApplicationController
  def create 
    if params[:user_id]
      FavoriteArticle.create!(fave_article_params)
      render json: {message: "Article saved to dashboard"}
    end
  end

  private 

  def fave_article_params
    params.permit(:author,
                  :title,
                  :year,
                  :date,
                  :isbn_issn,
                  :keywords,
                  :abstract,
                  :url,
                  :doi, 
                  :user_id )
  end
end