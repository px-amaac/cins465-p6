class Comment < ActiveRecord::Base
	belongs_to :digital_object_identifier
	belongs_to :user

	validates :comment, presence: true, length: { maximum: 255 }


end
