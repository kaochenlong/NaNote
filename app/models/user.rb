require 'digest'

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :account, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  before_create :encrypt_password

  has_many :notes

  has_many :bookmarks
  has_many :favorite_notes,
            through: :bookmarks,
            source: :note

  private
  def encrypt_password
    salted_pw = "xyz#{self.password}827128#{self.password}82-12j23h"
    self.password = Digest::SHA1.hexdigest(salted_pw)
  end
end
