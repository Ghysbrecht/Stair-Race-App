class Leaderboard < ApplicationRecord
  belongs_to :participant
  def timediff
    if stoptijd = nil
      return Time.at(stoptijd - starttijd).utc.to_i
    else 
      return 0 # don't break stuff
    end
  end

  def participant_name
    Participant.find(participant_id).name
  end

  def mqtt(message)
    begin
      puts message['dev_id']
      puts message['payload_fields']['time']
      puts message['payload_fields']['uid']
      self.participant_id = Participant.where(["uid = :u", { u: message['payload_fields']['uid'] }]).limit(1).ids[0]
      puts self.participant_id
      puts 'test'
      case message['dev_id']
      when 'starttimer'
        puts 'starttimer'
        self.starttijd = Time.new(message['payload_fields']['time']).utc
        self.save
      when 'finishtimer'
        puts 'finishtimer'
        entry = Leaderboard.where(participant_id: self.participant_id).order("created_at").last
        entry.update_attributes(
          stoptijd: Time.new(message['payload_fields']['time']).utc
        )
      else
        logger.error { 'TTN: could not find correct device ID' }
      end
      puts 'finished handling the mqtt message'
    rescue => ex
      Rails.logger.error ex.message
    end
  end
end
