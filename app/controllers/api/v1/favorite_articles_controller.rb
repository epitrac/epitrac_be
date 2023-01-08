class Api::V1::FavoriteArticlesController < ApplicationController

  def index 
    render json: FavoriteArticleSerializer.new(FavoriteArticle.all)
  end

end