class UserUpdateJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    puts "Calling Clearbit API for #{user.email}..."
    Clearbit.key = ENV['CLEARBIT_KEY']
    p response = Clearbit::Enrichment.find(email: user.email, stream: true)
    # TODO: update user object with new info retrieved from Clearbit
    puts "Done! Enriched #{user.email} with Clearbit"
  end
end
