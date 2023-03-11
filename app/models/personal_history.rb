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
      {
        year: get_year_month_from_happened_on(happened_on: educational_back_ground.happened_on)[0],
        month: get_year_month_from_happened_on(happened_on: educational_back_ground.happened_on)[1],
        description: educational_back_ground.description
      }
    end
  end

  def format_license_back_grounds
    license_back_grounds.map do |license_back_ground|
      {
        year: get_year_month_from_happened_on(happened_on: license_back_ground.happened_on)[0],
        month: get_year_month_from_happened_on(happened_on: license_back_ground.happened_on)[1],
        description: license_back_ground.description
      }
    end
  end

  private

    def get_year_month_from_happened_on(happened_on:)
      return '' if happened_on.nil?

      [happened_on.year, happened_on.month]
    end
end
