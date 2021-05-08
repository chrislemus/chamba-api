class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_line_items
  delegate :business, to: :customer

  accepts_nested_attributes_for :invoice_line_items
  # accept_method_attributes :invoice_line_item

end
