class Email < ApplicationRecord
  belongs_to :user

  # Validations
  validates :subject, presence: true
  validates :content, presence: true
end

