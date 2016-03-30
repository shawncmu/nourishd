class Challenge < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  has_attached_file :completed_image, styles: {
    large: "1000x1000>",
    medium: "300x300>",
    thumb: "100x100>"
  }

  validates_attachment_content_type :completed_image, content_type: /\Aimage\/.*\Z/
end
