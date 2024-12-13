class CreateUserEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :user_emails do |t|
      t.string :subject
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
