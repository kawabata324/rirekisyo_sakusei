class EducationalBackGround < ApplicationRecord
  DESCRIPTION_TITLE = "学歴"

  belongs_to :personal_history
end
