# == Schema Information
#
# Table name: user_emails
#
#  id         :bigint           not null, primary key
#  content    :text
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_user_emails_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserEmail < ApplicationRecord
    # Associations
    has_many :user_emails, dependent: :destroy
  
    # Validations
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    belongs_to :user
    
    validates :subject, presence: true
    validates :content, presence: true 
end
