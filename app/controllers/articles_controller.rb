class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.includes(:user).find params[:id]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path, notice: 'Succesfully created article'
    else
      render 'new'
    end  
  end


  def destroy
    Article.find(params[:id]).destroy
    flash[:notice] = "Article deleted"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
 end
