class User < ApplicationRecord
  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
