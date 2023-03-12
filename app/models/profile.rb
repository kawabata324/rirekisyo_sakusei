class Profile < ApplicationRecord
  belongs_to :personal_history
  # TODO: https://qiita.com/snyt45/items/faf846413d103c68adf9
  # validation Errorよりも先に、500Errorになってしまう
  enum sex: { man: 'man', woman: 'woman', unknown: '' }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PHONE_NUMBER_LENGTH = 11

  validates :email, { format: { with: VALID_EMAIL_REGEX }, allow_blank: true }
  validates :phone_number, { length: { is: PHONE_NUMBER_LENGTH }, allow_blank: true }
  validates :birth_date_on, { comparison: { less_than: proc { Date.today } }, allow_blank: true }
  validates :sex, { inclusion: { in: Profile.sexes.keys } }

  def format_birthdate
    return '年 月 日生' if birth_date_on.nil?

    "#{I18n.l(updated_on, format: :long)}生"
  end

  def format_age
    return '(満  歳)' if age.nil?

    "(満 #{age} 歳)"
  end

  def format_phone_number
    return '' if phone_number.nil?

    phone_number_str = phone_number.to_s
    "#{phone_number_str[0..2] || ''}-#{phone_number_str[3..6] || ''}-#{phone_number_str[7..10] || ''}"
  end
end
