class Owner < ApplicationRecord
  validates :id, uniqueness: true
  belongs_to :user
end
