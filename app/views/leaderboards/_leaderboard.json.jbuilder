json.extract! leaderboard, :id, :ranking, :player_id, :created_at, :updated_at
json.url leaderboard_url(leaderboard, format: :json)
