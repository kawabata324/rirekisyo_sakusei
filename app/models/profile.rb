class Profile < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PHONE_NUMBER_LENGTH = 11

  validates :email, { format: { with: VALID_EMAIL_REGEX } }
  validates :phone_number, { length: PHONE_NUMBER_LENGTH }
  validates :birth_date_on, comparison: { less_than: Proc.new { Date.today } }
end
