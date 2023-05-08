module Api
  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :comment_body, :article_id
    belongs_to :article
  end
end
