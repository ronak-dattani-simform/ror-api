module Api
  class ArticlesController < ApplicationController
    before_action :set_article, only: %i[ show update destroy ]

    def search 
      @articles = Article.where(title: params[:title])
      render json: @articles, each_serializer: ArticleWoCommentsSerializer
    end

    def index
      @articles = Article.all.page params[:page]
      render json: @articles, each_serializer: ArticleSerializer
    end

    def show
      render json: @article, serializer: ArticleSerializer
    end

    def create
      @article = Article.new(article_params)
      @article.release_date = Date.current
      if @article.save
        render json: @article, status: :created, serializer: ArticleSerializer
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end

    def update
      if @article.update(article_params)
        render json: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @article.destroy
    end

    private

      def set_article
        @article = Article.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:title, :body)
      end
  end
end