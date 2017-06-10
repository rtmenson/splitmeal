class Share < ApplicationRecord
  validates :order_id, :diner_id, presence: true
  belongs_to :user
  belongs_to :order
end
