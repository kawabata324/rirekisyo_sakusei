class PersonalHistory < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :self_content, dependent: :destroy
  has_many :educational_back_grounds, dependent: :destroy
  has_many :license_back_grounds, dependent: :destroy
  has_many :programing_back_grounds, dependent: :destroy
  has_many :internship_back_grounds, dependent: :destroy

  def updated_on
    updated_at.to_date
  end

  def format_back_grounds(back_grounds:)
    back_grounds.map do |back_ground|
      {
        year: get_year_month_from_happened_on(happened_on: back_ground.happened_on)[0],
        month: get_year_month_from_happened_on(happened_on: back_ground.happened_on)[1],
        description: back_ground.description
      }
    end
  end

  private

  def get_year_month_from_happened_on(happened_on:)
    return '' if happened_on.nil?

    [happened_on.year, happened_on.month]
  end
end
