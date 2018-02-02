require 'test_helper'

class Article::CommentTest < ActiveSupport::TestCase
  test "should not save comment without article" do
    comment = Article::Comment.new
    assert_not comment.save, "Saved the article without a title"
  end

  test "should  save coment with comment and body" do
    article = Article.create(title: '12354')
    comment = Article::Comment.new(article: article, body: '12345', commentor: '123456')
    assert comment.save, "Saved the comment with body and commentor"
  end

  test "should save comment with article" do
    article = Article.create(title: '12345')
    comment = Article::Comment.new(article: article)
    assert comment.save, "Saved the comment with a article"
  end
end
