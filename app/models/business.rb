class Business < ApplicationRecord
  belongs_to :owner, :class_name => "User"
  validates :name, presence: true
  has_many :customers
  has_many :invoices, through: :customers
  has_many :events, through: :owner
end
