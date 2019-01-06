class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :message, null: false
      t.string :image
      t.references :user, null: false, foreing_keys: true
      t.timestamps
    end
  end
end
