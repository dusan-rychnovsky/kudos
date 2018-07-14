class User < ApplicationRecord
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  has_many :kudos_to, dependent: :destroy, :foreign_key => "to_id", :class_name => "Kudo"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
