class Profile < ApplicationRecord
  belongs_to :personal_history

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PHONE_NUMBER_LENGTH = 11

  validates :email, { format: { with: VALID_EMAIL_REGEX }, allow_blank: true }
  validates :phone_number, { length: { is: PHONE_NUMBER_LENGTH }, allow_blank: true }
  validates :birth_date_on, { comparison: { less_than: Proc.new { Date.today } }, allow_blank: true }
end
