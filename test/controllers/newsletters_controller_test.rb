require 'test_helper'

class NewslettersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newsletter = newsletters(:one)
  end

  test "should forbid get index" do
    get newsletters_url
    assert_response :forbidden
  end

  test "should get index" do
    login(users(:me))
    get newsletters_url
    assert_response :success
  end

  test "should forbid get new" do
    get new_newsletter_url
    assert_response :forbidden
  end

  test "should get new" do
    login(users(:me))
    get new_newsletter_url
    assert_response :success
  end

  test "should forbid create newsletter" do
    assert_no_difference('Newsletter.count') do
      post newsletters_url, params: { newsletter: { content: @newsletter.content, object: @newsletter.object} }
    end

    assert_response :forbidden
  end

  test "should create newsletter" do
    login(users(:me))
    assert_difference('Newsletter.count') do
      post newsletters_url, params: { newsletter: { content: @newsletter.content, object: @newsletter.object} }
    end

    assert_redirected_to newsletter_url(Newsletter.last)
  end

  test "should forbid show newsletter" do
    get newsletter_url(@newsletter)
    assert_response :forbidden
  end

  test "should show newsletter" do
    login(users(:me))
    get newsletter_url(@newsletter)
    assert_response :success
  end

  test "should forbid get edit" do
    get edit_newsletter_url(@newsletter)
    assert_response :forbidden
  end

  test "should get edit" do
    login(users(:me))
    get edit_newsletter_url(@newsletter)
    assert_response :success
  end

  test "should forbid update newsletter" do
    patch newsletter_url(@newsletter), params: { newsletter: { content: @newsletter.content, object: @newsletter.object} }
    assert_response :forbidden
  end

  test "should update newsletter" do
    login(users(:me))
    patch newsletter_url(@newsletter), params: { newsletter: { content: @newsletter.content, object: @newsletter.object} }
    assert_redirected_to newsletter_url(@newsletter)
  end

  test "should forbid destroy newsletter" do
    assert_no_difference('Newsletter.count') do
      delete newsletter_url(@newsletter)
    end

    assert_response :forbidden
  end

  test "should destroy newsletter" do
    login(users(:me))
    assert_difference('Newsletter.count', -1) do
      delete newsletter_url(@newsletter)
    end

    assert_redirected_to newsletters_url
  end
end
