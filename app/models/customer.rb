class Customer < ApplicationRecord
  belongs_to :business
  validates :first_name, presence: true
end
