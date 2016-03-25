class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :challenges
  has_many :recipes, through: :challenges
  has_many :badges

  has_attached_file :dish_image, styles: {
    large: "1000x1000>",
    medium: "300x300>",
    thumb: "100x100>"
  }
  has_attached_file :ingredients_image, styles: {
    large: "1000x1000>",
    medium: "300x300>",
    thumb: "100x100>"
  }

  validates_attachment_content_type :dish_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :ingredients_image, content_type: /\Aimage\/.*\Z/
end
