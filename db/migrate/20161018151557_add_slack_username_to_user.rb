class AddSlackUsernameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slack_username, :string
  end
end
