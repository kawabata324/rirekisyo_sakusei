class Address < ApplicationRecord
  belongs_to :personal_history

  # TODO: あとでモデルのバリデーションかく

  def format_postal_code
    return '' if postal_code.nil?

    "#{postal_code.to_s[0..2] || ''}-#{postal_code.to_s[3..6] || ''}"
  end
end
