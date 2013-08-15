class ChangeColumn < ActiveRecord::Migration
  def up
  	change_column :users, :phone, :string
  end

  def down
  	change_column :users, :phone, :integer
  end
end
