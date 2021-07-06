class Event < ApplicationRecord
  belongs_to :user
  belongs_to :customer, optional: true
  has_one :business, through: :user
end
