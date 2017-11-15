class AddUserIdToOlders < ActiveRecord::Migration
  def change
        add_column :olders, :user_id, :integer

  end
end
