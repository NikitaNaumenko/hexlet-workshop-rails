class Web::Articles::CommentsController < Web::Articles::ApplicationController
  # http_basic_authenticate_with name: "viraj", password: "password", only: :destroy

  def create
    @comment = resource_article.comments.create(comment_params)
    redirect_to article_path(resource_article)
  end

  def destroy
    @comment = resource_article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(resource_article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commentor, :body)
  end
end
