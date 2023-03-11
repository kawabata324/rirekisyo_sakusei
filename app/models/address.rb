class Address < ApplicationRecord
  belongs_to :personal_history

  # TODO: あとでモデルのバリデーションかく
end
