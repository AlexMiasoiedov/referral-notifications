class User < ApplicationRecord
  #########
  # MIXINS:
  include Followable
  # MIXINS:
  #########

  ###############
  # DECLARATIONS:
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable
  # DECLARATIONS:
  ###############

  ###############
  # ASSOCIATIONS:
  belongs_to :referred_by, class_name: 'User', optional: true
  has_many :referred_users, class_name: 'User', foreign_key: :referred_by_id
  has_many :notifications, as: :recipient
  has_many :notification_subjects, as: :notifiable
  has_many :services
  has_many :event_participations, as: :eventable
  has_many :events
  # ASSOCIATIONS:
  ###############

  ##############
  # VALIDATIONS:
  validates :referral_code, uniqueness: true
  # VALIDATIONS:
  ##############

  ############
  # CALLBACKS:
  before_create do
    loop do
      self.referral_code = SecureRandom.hex(6)
      break unless self.class.exists?(referral_code: self.referral_code)
    end
  end
  # CALLBACKS:
  ############
end
