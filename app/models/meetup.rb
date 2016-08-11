class Meetup < ActiveRecord::Base
  belongs_to :user

  def self.my_meetups(user)
    where(user_id: user.id).order(:created_at)
  end
end
