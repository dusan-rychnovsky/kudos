class Kudo < ApplicationRecord
  belongs_to :from, class_name: "User"
  validates :to, presence: true
  validates :for, presence: true
end
