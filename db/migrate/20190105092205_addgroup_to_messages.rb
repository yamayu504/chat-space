class AddgroupToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :group, foreign_keys: true
  end
end
