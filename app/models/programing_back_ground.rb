class ProgramingBackGround < ApplicationRecord
  DESCRIPTION_TITLE = 'プログラミング歴'.freeze

  belongs_to :personal_history
end
