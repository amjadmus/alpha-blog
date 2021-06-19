class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy] #before_action helper runs the set_article function which was defined below in the givin actions


  def show


  end

  def index
    @articles = Article.all

  end

  def new
    @article = Article.new
  end

  def edit

  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfylly"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  def update

    if @article.update(article_params)
      flash[:notice] = "Article was updated!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy

    @article.destroy
    redirect_to articles_path

  end
  private
  def set_article
    return @article = Article.find(params[:id])  #params gets what ever user inputted when calling a method.
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end

end
