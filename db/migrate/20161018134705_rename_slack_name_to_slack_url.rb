class RenameSlackNameToSlackUrl < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :slack_name, :slack_url
  end
end
