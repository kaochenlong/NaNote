class Note < ApplicationRecord
	acts_as_paranoid
	validates :title, presence: true

	belongs_to :user
	has_many :comments

	has_many :bookmarks
	has_many :users, through: :bookmarks
end

