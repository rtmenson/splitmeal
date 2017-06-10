class Diner < ApplicationRecord
  validates :party_id, presence: true
  validates :user_id, :uniqueness => {:scope => :party_id}
  belongs_to :user
  belongs_to :party
  has_many :shares

  def user_name
    user.username
  end
end
