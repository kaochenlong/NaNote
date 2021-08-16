class Note < ApplicationRecord
	validates :title, presence: true
	default_scope { where(deleted_at: nil) }
end
