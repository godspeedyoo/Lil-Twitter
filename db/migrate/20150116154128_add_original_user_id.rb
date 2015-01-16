class AddOriginalUserId < ActiveRecord::Migration
  def change
    add_column :tweets, :original_user_id, :integer
  end
end
