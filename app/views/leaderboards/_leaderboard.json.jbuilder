json.extract! leaderboard, :id, :stoptijd, :starttijd, :participant_id, :game, :created_at, :updated_at
json.url leaderboard_url(leaderboard, format: :json)
