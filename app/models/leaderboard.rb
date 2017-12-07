class Leaderboard < ApplicationRecord
  belongs_to :participant
def timediff
  Time.at(stoptijd - starttijd).utc
end
end
