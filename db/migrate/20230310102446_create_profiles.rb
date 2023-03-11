class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name, default: ''
      t.string :first_name_kana, default: ''
      t.string :last_name, default: ''
      t.string :last_name_kana, default: ''
      t.string :email, default: ''
      t.integer :phone_number
      t.date :birth_date_on
      t.integer :age
      t.string :sex, default: ''
      t.references :personal_history, null: false,foreign_key: true

      t.timestamps
    end
  end
end
