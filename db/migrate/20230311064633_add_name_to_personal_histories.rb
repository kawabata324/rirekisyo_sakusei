class AddNameToPersonalHistories < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_histories, :name, :string, null: false, default: '履歴書', comment: 'ファイル名に表示する'
  end
end
