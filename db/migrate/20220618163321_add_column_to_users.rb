class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def AddNameToUsers
    add_index :users, :name, unique:true
  end
end
