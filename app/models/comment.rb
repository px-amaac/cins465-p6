class Comment < ActiveRecord::Base
	belongs_to :digital_object_identifier
	belongs_to :user

	validates :comment, presence: true, length: { maximum: 255 }
	validates :digital_object_identifier_id, :user_id, presence: true

end
