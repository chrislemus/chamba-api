class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_line_items
  delegate :business, to: :customer

  accepts_nested_attributes_for :invoice_line_items, allow_destroy: true
  # accept_method_attributes :invoice_line_item


  def total
    self.invoice_line_items.sum(:price).to_f
  end
  def business_name
    self.business.name
  end

  def customer_full_name
    self.customer.full_name
  end

  def status
    if self.paid_date
      'paid'
    elsif self.canceled
      'canceled'
    elsif self.due_date && Date.today > self.due_date 
      'overdue'
    else
      'pending'
    end
  end

end
