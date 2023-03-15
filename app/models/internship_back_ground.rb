class InternshipBackGround < ApplicationRecord
  DESCRIPTION_TITLE = 'インターン・アルバイト・職歴'.freeze

  belongs_to :personal_history
end
