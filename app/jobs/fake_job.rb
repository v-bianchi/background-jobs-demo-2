class FakeJob < ApplicationJob
  queue_as :default # :critical, :mailers...

  def perform
    puts "I'm starting the fake job..."
    sleep 5
    puts "Job done!"
  end
end
