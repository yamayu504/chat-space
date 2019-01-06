class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :group, null:false, foreign_keys: true
      t.references :user,  null:false, foreign_keys: true
      t.timestamps
    end
  end
end
