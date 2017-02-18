class ArticlesController < ApplicationController
  
  def index
    @articles = Article.order('created_at desc')
  end

  def show
    @article = Article.includes(:user).find params[:id]
  end

  def new
    @article = Article.new
    @tags = Tag.all
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

  def search
    @q = params[:q]
    @articles = Article.search(@q)
    render 'index'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, tag_ids: [])
  end
 end
