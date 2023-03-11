class PersonalHistory < ApplicationRecord
  has_one :profile
  has_one :address

  def updated_on
    self.updated_at.to_date
  end
end
