# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  # Associations
  has_many :user_emails, dependent: :destroy
  has_many :records, dependent: :destroy

  # Validations
  # Before
  validates :user_email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # After
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }


  def user_email
    self.email # Adjust this logic based on your requirements.
  end

end
