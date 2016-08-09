class Handicap < ActiveRecord::Base
  belongs_to :user

 def self.my_handicaps(user_id)
   where(user_id: user_id)
 end
end
