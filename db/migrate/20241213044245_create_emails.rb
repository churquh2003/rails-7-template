class CreateEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :emails do |t|
      t.string :recipient
      t.string :subject
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
