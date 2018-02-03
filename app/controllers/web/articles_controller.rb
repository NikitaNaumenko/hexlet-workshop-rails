class Web::ArticlesController < Web::ApplicationController
  # before_action :find_resource, except: %i[index edit new]
  # http_basic_authenticate_with name: "viraj", password: "password", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def moderate
    @article.send_to_moderation!
    redirect_to @article
  end

  private

  def find_resource
    @article ||= Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :text, links_attributes: [:id, :url, :destroy])
  end
end
