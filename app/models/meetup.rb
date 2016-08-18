class Meetup < ActiveRecord::Base
  belongs_to :user
  has_many :partners
  has_many :comments
  validates :datetime, :description, presence: true

  def self.my_meetups(user)
    where(user_id: user.id).order(:created_at)
  end

end
