require "test_helper"

class MatchCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @match_comment = match_comments(:one)
  end

  test "should get index" do
    get match_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_match_comment_url
    assert_response :success
  end

  test "should create match_comment" do
    assert_difference('MatchComment.count') do
      post match_comments_url, params: { match_comment: { descrption: @match_comment.descrption, match_id: @match_comment.match_id } }
    end

    assert_redirected_to match_comment_url(MatchComment.last)
  end

  test "should show match_comment" do
    get match_comment_url(@match_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_match_comment_url(@match_comment)
    assert_response :success
  end

  test "should update match_comment" do
    patch match_comment_url(@match_comment), params: { match_comment: { descrption: @match_comment.descrption, match_id: @match_comment.match_id } }
    assert_redirected_to match_comment_url(@match_comment)
  end

  test "should destroy match_comment" do
    assert_difference('MatchComment.count', -1) do
      delete match_comment_url(@match_comment)
    end

    assert_redirected_to match_comments_url
  end
end
