# == Schema Information
#
# Table name: emails
#
#  id         :bigint           not null, primary key
#  body       :text
#  recipient  :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_emails_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Email < ApplicationRecord
  belongs_to :user
end
