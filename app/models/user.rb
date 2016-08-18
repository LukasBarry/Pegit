class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :handicaps
  has_many :meetups
  has_many :partners
  has_many :comments


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "50x50" }, :default_url => "/images/drvl.png"

  attr_accessor :remove_avatar
  before_validation { avatar.clear if remove_avatar == '1' }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def partner?(meetup)
    meetup.partners.where(user_id: id).any?
  end
  def lowest_differentials
    self.handicaps.sort { |handicap| handicap.differential}
  end
end
