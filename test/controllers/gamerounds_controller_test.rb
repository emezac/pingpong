require 'test_helper'

class GameroundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gameround = gamerounds(:one)
  end

  test "should get index" do
    get gamerounds_url
    assert_response :success
  end

  test "should get new" do
    get new_gameround_url
    assert_response :success
  end

  test "should create gameround" do
    assert_difference('Gameround.count') do
      post gamerounds_url, params: { gameround: { game_id: @gameround.game_id, round: @gameround.round } }
    end

    assert_redirected_to gameround_url(Gameround.last)
  end

  test "should show gameround" do
    get gameround_url(@gameround)
    assert_response :success
  end

  test "should get edit" do
    get edit_gameround_url(@gameround)
    assert_response :success
  end

  test "should update gameround" do
    patch gameround_url(@gameround), params: { gameround: { game_id: @gameround.game_id, round: @gameround.round } }
    assert_redirected_to gameround_url(@gameround)
  end

  test "should destroy gameround" do
    assert_difference('Gameround.count', -1) do
      delete gameround_url(@gameround)
    end

    assert_redirected_to gamerounds_url
  end
end
