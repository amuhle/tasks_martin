class AddDefaultValueToUserStatusAttribute < ActiveRecord::Migration
  def change
  	change_column :users, :status, :string, :default => 'active'
  end

  def down
  	change_column :users, :status, :string, :default => nil
  end
end
