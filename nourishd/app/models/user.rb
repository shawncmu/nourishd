class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :created_recipes, class_name: 'Recipe', foreign_key: 'creator'
  has_many :challenges, as: :participant
  has_many :badges

  has_attached_file :avatar_image, styles: {
    medium: "300x300>",
    thumb: "100x100>"
  }

  validates_attachment_content_type :avatar_image, content_type: /\Aimage\/.*\Z/
end
