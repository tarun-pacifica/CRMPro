class AddIsAdminToUsers < ActiveRecord::Migration
  def change
  	add_column :people, :is_admin, :boolean, :default => false
  end
end
