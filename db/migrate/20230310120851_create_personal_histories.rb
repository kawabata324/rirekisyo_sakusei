class CreatePersonalHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_histories do |t|
      t.string :uuid

      t.timestamps
    end
  end
end
