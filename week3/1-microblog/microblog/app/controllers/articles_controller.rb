# My Controller class
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(params_article)

    @article.save
    redirect_to @article
  end

  private

  def params_article
    params.require(:article).permit(:title, :text)
  end
end
