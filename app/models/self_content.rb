class SelfContent < ApplicationRecord
  TITLE = '自己PR・志望動機・アピールポイントなど'

  belongs_to :personal_history
end
