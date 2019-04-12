require 'test_helper'

class ScoreboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scoreboard = scoreboards(:one)
  end

  test "should get index" do
    get scoreboards_url
    assert_response :success
  end

  test "should get new" do
    get new_scoreboard_url
    assert_response :success
  end

  test "should create scoreboard" do
    assert_difference('Scoreboard.count') do
      post scoreboards_url, params: { scoreboard: { player_id: @scoreboard.player_id, scoreplayer1: @scoreboard.scoreplayer1, scoreplayer2: @scoreboard.scoreplayer2 } }
    end

    assert_redirected_to scoreboard_url(Scoreboard.last)
  end

  test "should show scoreboard" do
    get scoreboard_url(@scoreboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_scoreboard_url(@scoreboard)
    assert_response :success
  end

  test "should update scoreboard" do
    patch scoreboard_url(@scoreboard), params: { scoreboard: { player_id: @scoreboard.player_id, scoreplayer1: @scoreboard.scoreplayer1, scoreplayer2: @scoreboard.scoreplayer2 } }
    assert_redirected_to scoreboard_url(@scoreboard)
  end

  test "should destroy scoreboard" do
    assert_difference('Scoreboard.count', -1) do
      delete scoreboard_url(@scoreboard)
    end

    assert_redirected_to scoreboards_url
  end
end
