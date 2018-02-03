module Articles
  module Comments
    module Likes
      CreateSchema = Dry::Validation.Schema(BaseSchema) do
        configure do
          config.namespace = :likes
          option :comment

          def time_and_count_restraint?(likes_count)
            comment.likes.desc_ordered.time_restraint.count < likes_count
          end
        end

        required(:comment_id).filled
        required(:likes_count).filled(:time_and_count_restraint?)
      end
    end
  end
end
