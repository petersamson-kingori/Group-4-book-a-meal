require "test_helper"

class CaterersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caterer = caterers(:one)
  end

  test "should get index" do
    get caterers_url, as: :json
    assert_response :success
  end

  test "should create caterer" do
    assert_difference('Caterer.count') do
      post caterers_url, params: { caterer: { business_name: @caterer.business_name, email: @caterer.email, password_digest: @caterer.password_digest, username: @caterer.username } }, as: :json
    end

    assert_response 201
  end

  test "should show caterer" do
    get caterer_url(@caterer), as: :json
    assert_response :success
  end

  test "should update caterer" do
    patch caterer_url(@caterer), params: { caterer: { business_name: @caterer.business_name, email: @caterer.email, password_digest: @caterer.password_digest, username: @caterer.username } }, as: :json
    assert_response 200
  end

  test "should destroy caterer" do
    assert_difference('Caterer.count', -1) do
      delete caterer_url(@caterer), as: :json
    end

    assert_response 204
  end
end
