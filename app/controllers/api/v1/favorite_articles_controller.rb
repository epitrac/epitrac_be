class Api::V1::FavoriteArticlesController < ApplicationController

  def index 
    render json: FavoriteArticleSerializer.new(FavoriteArticle.all)
  end

  def destroy 

    if FavoriteArticle.exists?(params[:id])
      render json: FavoriteArticle.destroy(params[:id])
    else
      render json: {error: "no favorite article exists with that id"}, status: 404
    end
  end

end