class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, comment: '7桁の郵便番号'
      t.string :content, default: '', comment: '県市町村区、番地・建物など'
      t.string :content_kana, default: '', comment: 'contentカラムのふりがな'
      t.references :personal_history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
