class MenuItem < ApplicationRecord
    validates :name, uniqueness: true
    validates :name,
              :price, presence: true
    has_many :orders
end
