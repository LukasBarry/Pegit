class Handicap < ActiveRecord::Base
  belongs_to :user
  validates :score, :course_rating, :course_slope_rating, presence: true

 def self.my_handicaps(user)
   where(user_id: user.id)
 end
end
