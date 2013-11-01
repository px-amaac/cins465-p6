class DigitalObjectIdentifier < ActiveRecord::Base
	
	belongs_to :user
	has_many :urls, :dependent => :destroy
	has_many :comments, :dependent => :destroy

	accepts_nested_attributes_for :urls, :comments

	validates :integer_identifier, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { maximum: 10 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
	validates :description, presence: true, length: { maximum: 255 }
	

	def self.search(query)
    where("name like ?", query)
  end

end
