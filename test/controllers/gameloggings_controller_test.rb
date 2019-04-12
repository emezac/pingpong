require 'test_helper'

class GameloggingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gamelogging = gameloggings(:one)
  end

  test "should get index" do
    get gameloggings_url
    assert_response :success
  end

  test "should get new" do
    get new_gamelogging_url
    assert_response :success
  end

  test "should create gamelogging" do
    assert_difference('Gamelogging.count') do
      post gameloggings_url, params: { gamelogging: { eventime: @gamelogging.eventime, finalpoints: @gamelogging.finalpoints, game_id: @gamelogging.game_id, newschronic: @gamelogging.newschronic, player1_id: @gamelogging.player1_id, player2_id: @gamelogging.player2_id, scorepl1: @gamelogging.scorepl1, scoreplayer2: @gamelogging.scoreplayer2 } }
    end

    assert_redirected_to gamelogging_url(Gamelogging.last)
  end

  test "should show gamelogging" do
    get gamelogging_url(@gamelogging)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamelogging_url(@gamelogging)
    assert_response :success
  end

  test "should update gamelogging" do
    patch gamelogging_url(@gamelogging), params: { gamelogging: { eventime: @gamelogging.eventime, finalpoints: @gamelogging.finalpoints, game_id: @gamelogging.game_id, newschronic: @gamelogging.newschronic, player1_id: @gamelogging.player1_id, player2_id: @gamelogging.player2_id, scorepl1: @gamelogging.scorepl1, scoreplayer2: @gamelogging.scoreplayer2 } }
    assert_redirected_to gamelogging_url(@gamelogging)
  end

  test "should destroy gamelogging" do
    assert_difference('Gamelogging.count', -1) do
      delete gamelogging_url(@gamelogging)
    end

    assert_redirected_to gameloggings_url
  end
end
