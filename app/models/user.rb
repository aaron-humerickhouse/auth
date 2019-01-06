class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable, :lockable, :password_archivable,
         :password_expirable

  has_many :access_grants, class_name: "Doorkeeper::AccessGrant",
                           foreign_key: :resource_owner_id,
                           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens, class_name: "Doorkeeper::AccessToken",
                           foreign_key: :resource_owner_id,
                           dependent: :delete_all # or :destroy if you need callbacks

  validate :password_complexity
  validates :first_name, format: {with: /\A[a-zA-Z'\-]*\z/}, length: { minimum: 2 }
  validates :last_name, format: {with: /\A[a-zA-Z'\-]*\z/}, length: { minimum: 2 }

private

  def password_complexity
    if password.present? and not password.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/)
      errors.add :password, "must contain big, small letters and digits"
    end
  end
end
