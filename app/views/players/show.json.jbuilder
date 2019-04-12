json.set! :player do
  json.partial! "players/player", player: @player
end

json.set! :histories do
  json.array! @player.histories, partial: 'histories/history', as: :history
end

json.set! :history_statuses do
  json.array! History.statuses_json
end
