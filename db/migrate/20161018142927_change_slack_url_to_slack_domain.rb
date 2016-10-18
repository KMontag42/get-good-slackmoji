class ChangeSlackUrlToSlackDomain < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :slack_url, :slack_domain
  end
end
