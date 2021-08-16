class Note < ApplicationRecord
	acts_as_paranoid
	validates :title, presence: true

end

