class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    @article = Article.create(article_params)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(article_params)
    @article.update
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :articles
  end

  private

  def article_params
    params.require(:articles).permit(:title, :content)
  end
end
