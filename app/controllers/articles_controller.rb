class ArticlesController < ApplicationController
  
  def index
    @tags = Tag.all
    @filter_params = {}
    @sub_tags = []
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

  def filter
    @tags = Tag.all
    @filter_params = filter_params
    @sub_tags = @tags.where(parent_id: @filter_params[:tag])
    @articles = Article.filter(@filter_params)
    render 'index'
  end

  def get_sub_tags
    tag = Tag.parent_tags.find params[:tag]
    render json: tag.sub_tags.to_json(only: [:name, :id]), status: :ok
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, tag_ids: [])
  end

  def filter_params
    params.require(:filter).permit(:text, :tag, :sub_tag)
  end

end
