# My Controller class
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def params_article
    params.require(:article).permit(:title, :text)
  end
end
