class DigitalObjectIdentifier < ActiveRecord::Base

	validates :integer_identifier, presence: true, uniqueness: true, numericality: {only_integer: true}, length: 10
	validates :name_identifier, presence: true, uniqueness: true, length: { maximum: 20 }
	validates :description, presence: true, length: { maximum: 255 }
	
end
