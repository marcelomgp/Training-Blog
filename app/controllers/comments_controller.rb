class CommentsController < ApplicationController

http_basic_authenticate_with name: "admin", password: "admin123",
only: [:destroy]

  def create
    @blog_item = Article.find(params[:article_id])
    @comment = @blog_item.comments.create(comment_params)

    redirect_to article_path(@blog_item)
  end

  def destroy
    @blog_item = Article.find(params[:article_id])
    @comment = @blog_item.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@blog_item)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end 

end
