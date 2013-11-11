class UserPasswordConfirmation < ActiveRecord::Migration
  def change
  	add_column :users, :password_confirmation, :integer
  end
end
