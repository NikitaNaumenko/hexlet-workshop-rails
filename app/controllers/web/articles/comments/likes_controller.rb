module Web
  module Articles
    module Comments
      class LikesController < Web::Articles::Comments::ApplicationController
        before_action :find_comment, only: :create
        def create
          if validation.success?
            @comment.likes.create
            redirect_to @article
          else
            redirect_to @article, notice: validation.errors
          end
        end

        private
        
        def validation
          ::Articles::Comments::Likes::CreateSchema.with(comment: @comment).call(comment_id: params[:comment_id], likes_count: 5)
        end
      end
    end
  end
end
