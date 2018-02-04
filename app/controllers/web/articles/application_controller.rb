module Web
  module Articles
    class ApplicationController < Web::ApplicationController
      def resource_article
        @article ||= Article.find(params[:article_id])
      end
    end
  end
end
