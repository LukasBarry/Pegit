class Meetup < ActiveRecord::Base
  belongs_to :user
  validates :datetime, :description, presence: true

  def self.my_meetups(user)
    where(user_id: user.id).order(:created_at)
  end
end
