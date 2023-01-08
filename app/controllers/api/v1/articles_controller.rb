class Api::V1::ArticlesController < ApplicationController
  def index
    if params[:disease]
      render json: ArticleSerializer.new(ArticleFacade.articles(params[:disease]))
    else 
      render json: {error: "cannot return articles without a disease"}, status: 404

    end
  end
end
