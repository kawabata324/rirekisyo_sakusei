class PersonalHistory < ApplicationRecord
  has_one :profile
  has_one :address
  has_many :educational_back_grounds
  has_many :license_back_grounds

  def updated_on
    self.updated_at.to_date
  end

  def format_educational_back_grounds
    educational_back_grounds.map do |educational_back_ground|
      happened_on = educational_back_ground.happened_on || ''
      {
        year: happened_on.blank? || happened_on.year,
        month: happened_on.blank? || happened_on.month,
        description: educational_back_ground.description
      }
    end
  end
end
