class Handicap < ActiveRecord::Base
  belongs_to :user

 def self.my_handicaps(user)
   where(user_id: user.id)
 end
end
