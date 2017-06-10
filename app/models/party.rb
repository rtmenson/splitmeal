class Party < ApplicationRecord
  validates :id, uniqueness: true
  validates :name, presence: true
  has_many :diners, :dependent => :nullify
  has_many :orders, :dependent => :destroy
end
