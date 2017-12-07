class Leaderboard < ApplicationRecord
  belongs_to :participant
def timediff
  Time.at(stoptijd - starttijd).utc.to_i
end
def participant_name
  return Participant.find(participant_id).name
end
end