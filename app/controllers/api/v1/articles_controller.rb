class Api::V1::ArticlesController < ApplicationController 
  def index 
    render json: ArticleSerializer.new(ArticleFacade.articles(params[:disease]))
  end
end
