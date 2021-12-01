class Api::ArticlesController < ApplicationController
  before_action :validate_params_presence, only: [:create]
  def index
    articles = Article.all
    render json: { articles: articles }
  end

  def create
    article = Article.create(params[:article].permit!)
    # if article.persisted?
    render json: { article: article }, status: 422
    #   else
    #     render json: { message: article.errors.full_message.to_sentence }
    #   end
    # end
  end

  private

  def validate_params_presence
    render json: { message: 'missing params' }, status: 422 if params[:article].nil?
  end

  # def article_params
  #   params[:article].permit(:title, :content)
  # end
end
