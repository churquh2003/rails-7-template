class AddConsentedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :consented, :boolean
  end
end
