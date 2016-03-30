class Challenge < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  has_many :likes
  has_many :comments

  has_attached_file :completed_image1, styles: {
    large: "500x500>",
    medium: "300x300>",
    thumb: "100x100>"
  }
  has_attached_file :completed_image2, styles: {
    large: "500x500>",
    medium: "300x300>",
    thumb: "100x100>"
  }

  validates_attachment_content_type :completed_image1, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :completed_image2, content_type: /\Aimage\/.*\Z/
end
