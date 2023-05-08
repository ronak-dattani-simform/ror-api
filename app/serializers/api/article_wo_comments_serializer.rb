module Api
  class ArticleWoCommentsSerializer < ActiveModel::Serializer
    attributes :title, :body
  end
end