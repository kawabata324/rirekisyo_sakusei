class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :first_name_kana
      t.string :last_name
      t.string :last_name_kana
      t.string :email
      t.integer :phone_number
      t.date :birth_date_on
      t.integer :age
      t.string :sex, default: 'unknown'

      t.timestamps
    end
  end
end
