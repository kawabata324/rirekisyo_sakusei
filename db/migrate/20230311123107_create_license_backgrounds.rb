class CreateLicenseBackgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :license_backgrounds do |t|
      t.references :personal_history, null: false, foreign_key: true
      t.string :description, default: '', comment: '資格や免許の概要'
      t.date :happened_on, '資格・免許取得日'

      t.timestamps
    end
  end
end
