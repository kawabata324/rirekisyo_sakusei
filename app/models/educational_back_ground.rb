class EducationalBackGround < ApplicationRecord
  DESCRIPTION_TITLE = '学歴'.freeze

  belongs_to :personal_history
end
