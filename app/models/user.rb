class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :id, uniqueness: true
  has_many :shares, :dependent => :destroy
  has_many :owners, :dependent => :destroy
  has_many :diners, :dependent => :destroy
#  belongs_to :party

end
