class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :following_id
      t.integer :follower_id
    end
  end
end
