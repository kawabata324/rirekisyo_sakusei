class CreateEducationalBackGrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :educational_back_grounds do |t|
      t.references :personal_history, null: false, foreign_key: true
      t.string :description, default: ''
      t.date :happened_on

      t.timestamps
    end
  end
end
