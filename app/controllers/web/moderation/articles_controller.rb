module Web
  module Moderation
    class ArticlesController < Web::Moderation::ApplicationController
      before_action :find_resource, except: :index
      def index
        default_params = { state_eq: 'on_moderation' }
        @q = Article.ransack(params[:q] || default_params)
        @articles = @q.result.uniq
      end

      def edit
        @article = ModerateArticleType.find(params[:id])
      end

      def update
        @article = ModerateArticleType.find(params[:id])
        if @article.update(article_params)
          redirect_to moderation_articles_path
        else
          render 'edit'
        end
      end

      private

      def article_params
        params.require(:article)
      end
    end
  end
end
