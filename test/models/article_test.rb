require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end

  test "should not save article with short title" do
    article = Article.new(title: '1234')
    assert_not article.save, "Saved the article with short a title"
  end

  test "should save article with title" do
    article = Article.new(title: '12345')
    assert article.save, "Saved the article with a title"
  end
end

