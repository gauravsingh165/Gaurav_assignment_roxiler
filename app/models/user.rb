class User < ApplicationRecord
  belongs_to :role
  has_many :job_applications, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  # Helper method
  def role_name
    role&.name&.downcase
  end

  def admin?
    role_name == 'admin'
  end

  def candidate?
    role_name == 'candidate'
  end
end
