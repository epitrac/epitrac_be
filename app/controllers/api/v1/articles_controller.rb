class Api::V1::ArticlesController < ApplicationController
  def index
    # require "pry"; binding.pry
    render json: ArticleSerializer.new(ArticleFacade.articles(params[:disease]))
  end
end
