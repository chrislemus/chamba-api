class Customer < ApplicationRecord
  belongs_to :business
  validates :first_name, presence: true
  has_many :invoices

  def save
    self.full_name = self.first_name unless self.first_name.empty?
    self.full_name += " #{self.last_name }" unless self.last_name && self.last_name.empty?
    super
  end


  def invoices_overview
    paid_invoices_total = 0
    unpaid_invoices_total = 0
    self.invoices.each { |invoice| 
      invoice_total = invoice.total
      if invoice.status === 'paid'
        paid_invoices_total += invoice_total.to_f
      elsif invoice.status === 'pending' || invoice.status === 'overdue'
        unpaid_invoices_total += invoice_total.to_f
      end
    }
      return {
        paid_invoices_total: paid_invoices_total,
        unpaid_invoices_total: unpaid_invoices_total
      }
  end

end
