class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  belongs_to :referred_by, class_name: 'User', optional: true
  has_many :referred_users, class_name: 'User', foreign_key: :referred_by_id

  validates :referral_code, uniqueness: true

  before_create do
    loop do
      self.referral_code = SecureRandom.hex(6)
      break unless self.class.exists?(referral_code: self.referral_code)
    end
  end
end
