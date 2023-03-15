class SelfContent < ApplicationRecord
  TITLE = '自己PR・志望動機・アピールポイントなど'.freeze

  belongs_to :personal_history
end
