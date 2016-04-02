class Challenge < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'

  belongs_to :recipe
  has_many :likes
  has_many :comments

  has_attached_file :creator_image, styles: {
    large: "500x500>",
    medium: "300x300>",
    thumb: "100x100>"
  }
  has_attached_file :participant_image, styles: {
    large: "500x500>",
    medium: "300x300>",
    thumb: "100x100>"
  }

  validates_attachment_content_type :creator_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :participant_image, content_type: /\Aimage\/.*\Z/
end
