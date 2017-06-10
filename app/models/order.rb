class Order < ApplicationRecord
  validates :id, uniqueness: true
  validates :party_id, :menu_item_id, presence: true
  has_many :shares, :dependent => :destroy
  belongs_to :menu_item
  belongs_to :party
end
