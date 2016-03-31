class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :created_challenges, class_name: 'Challenge', foreign_key: 'creator_id'
  has_many :participating_challenges, class_name: 'Challenge', foreign_key: 'participant_id'
  has_many :recipes
  has_many :badges
  has_many :comments
  has_many :likes

  has_attached_file :avatar_image, styles: {
    medium: "300x300>",
    thumb: "100x100>"
  }

  validates_attachment_content_type :avatar_image, content_type: /\Aimage\/.*\Z/
end
