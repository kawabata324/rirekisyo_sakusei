class LicenseBackGround < ApplicationRecord
  DESCRIPTION_TITLE = '資格・免許'.freeze

  belongs_to :personal_history
end
