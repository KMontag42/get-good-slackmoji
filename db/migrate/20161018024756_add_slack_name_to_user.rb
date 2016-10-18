class AddSlackNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slack_name, :string
  end
end
