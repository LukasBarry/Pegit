class Handicap < ActiveRecord::Base
  belongs_to :user
  validates :score, :course_rating, :course_slope_rating, presence: true
  after_create{self.update_attribute(:differential, self.get_differential)}

  def self.my_handicaps(user)
    where(user_id: user.id)
  end
  def get_differential
    ((self.score - self.course_rating) * 113) / self.course_slope_rating
  end
   

end
