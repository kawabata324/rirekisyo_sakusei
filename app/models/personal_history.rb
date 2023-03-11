class PersonalHistory < ApplicationRecord
  has_one :profile

  def updated_on
    self.updated_at.to_date
  end
end
