module Web
  module Articles
    module Comments
      class ApplicationController < Web::Articles::ApplicationController
        def find_comment
          @article = Article.find(params[:article_id])
          @comment = @article.comments.find(params[:comment_id])
        end
      end
    end
  end
end
