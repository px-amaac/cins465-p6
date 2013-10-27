class Url < ActiveRecord::Base
  belongs_to :digital_object_identifier
	default_scope -> { order('created_at DESC') }
  VALID_URL_REGEX = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[.\!\/\\w]*))?)/
  validates :url, presence: true, format: { with: VALID_URL_REGEX }, uniqueness: { case_sensitive: false } 

end
