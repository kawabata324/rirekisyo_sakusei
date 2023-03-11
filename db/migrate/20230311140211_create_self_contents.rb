class CreateSelfContents < ActiveRecord::Migration[7.0]
  def change
    create_table :self_contents do |t|
      t.references :personal_history, null: false, foreign_key: true
      t.text :description, default: ''

      t.timestamps
    end
  end
end
