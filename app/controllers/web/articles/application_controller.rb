module Web
  module Articles
    class ApplicationController < Web::ApplicationController
      def find_resource
        @article ||= Article.find(params[:article_id])
      end
    end
  end
end
