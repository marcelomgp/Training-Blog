class ArticlesController < ApplicationController

  def new
    @blog_item = Article.new
  end

  def create
    @blog_item = Article.new(security_params)
    #binding.pry

    if @blog_item.save
      redirect_to @blog_item
    else
      render 'new'
    end

  end

  def show
    @blog_item = Article.find(params[:id])
    print @blog_item
  end

  def edit
    @blog_item = Article.find(params[:id])
  end

  def update
    @blog_item = Article.find(params[:id])

    if @blog_item.update(security_params)
      redirect_to @blog_item
    else
      render 'edit'
    end

  end

  def index
    @blog_item = Article.all
    #binding.pry
  end

  private
    def security_params
      params.require(:article).permit(:title, :text)
    end

end
