class Note < ApplicationRecord
	acts_as_paranoid
	validates :title, presence: true

	belongs_to :user
	has_many :comments

	has_many :bookmarks
	has_many :users, through: :bookmarks

	include AASM
	aasm column: 'state' do
    state :draft, initial: true
    state :published, :hidden

    event :publish do
      transitions from: :draft, to: :published

			# after do
			# 	puts "發送簡訊"
			# end
    end

    event :hide do
      transitions from: :published, to: :hidden
    end

    event :recall do
      transitions from: [:published, :hidden], to: :draft
    end
  end


end

