require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:bela)
    # This code is not idiomatically correct.
    @post = @user.posts.build(title: "Dummy title", content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "title should be present" do
    @post.title = "   "
    assert_not @post.valid?
  end

  test "title should be at most 50 characters" do
    @post.title = "a" * 51
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = "   "
    assert_not @post.valid?
  end

  test "content should be at most 140 characters" do
    @post.content = "a" * 141
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end
end
