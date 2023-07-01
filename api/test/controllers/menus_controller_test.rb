require "test_helper"

class MenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu = menus(:one)
  end

  test "should get index" do
    get menus_url, as: :json
    assert_response :success
  end

  test "should create menu" do
    assert_difference('Menu.count') do
      post menus_url, params: { menu: { caterer_id: @menu.caterer_id, description: @menu.description, isSelected: @menu.isSelected, name: @menu.name, price: @menu.price } }, as: :json
    end

    assert_response 201
  end

  test "should show menu" do
    get menu_url(@menu), as: :json
    assert_response :success
  end

  test "should update menu" do
    patch menu_url(@menu), params: { menu: { caterer_id: @menu.caterer_id, description: @menu.description, isSelected: @menu.isSelected, name: @menu.name, price: @menu.price } }, as: :json
    assert_response 200
  end

  test "should destroy menu" do
    assert_difference('Menu.count', -1) do
      delete menu_url(@menu), as: :json
    end

    assert_response 204
  end
end
