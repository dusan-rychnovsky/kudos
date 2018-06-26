class Kudo < ApplicationRecord
  validates :from, presence: true
  validates :to, presence: true
  validates :for, presence: true
end
