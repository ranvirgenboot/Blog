class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]
                            
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  def my_article
    @articles = current_user.articles
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def authorize_user
    unless current_user == @article.user
      redirect_to @article, alert: 'You are not authorized to perform this action.'
    end
  end
end



















