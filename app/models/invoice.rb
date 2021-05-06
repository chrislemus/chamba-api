class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :business
  has_many :invoice_line_items
end
