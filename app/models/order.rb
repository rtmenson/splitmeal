class Order < ApplicationRecord
  validates :party_id, :menu_item_id, presence: true
  has_many :shares, :dependent => :destroy
  belongs_to :party
end
