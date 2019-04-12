json.extract! player, :id, :name, :email, :street, :city, :postal_code, :created_at, :updated_at
json.url player_url(player, format: :json)
