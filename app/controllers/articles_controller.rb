class ArticlesController < ApplicationController
  def show

    @article = Article.find(params[:id]) #params gets what ever user inputted when calling a method.
  end

  def index
    @articles = Article.all
    
  end
end
