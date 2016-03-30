class Recipe < ActiveRecord::Base
  has_many :quantities
  has_many :ingredients, through: :quantities
  belongs_to :creator, class_name: 'User', foreign_key: 'creator'
  has_many :challenges
  has_many :participants, through: :challenges, class_name: 'User', foreign_key: 'participant_id'
  has_many :instructions


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
