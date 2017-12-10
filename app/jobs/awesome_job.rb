class AwesomeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    loop do
        #puts "werkt dit?"
        #puts "nope! failed"
        sleep 5
    end
  end
end