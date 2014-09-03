class ChangeEmailDefault < ActiveRecord::Migration
  def change
    change_column :users, :email_favorites, :boolean, default: true
  end
end
