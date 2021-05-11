class Customer < ApplicationRecord
  belongs_to :business
  validates :first_name, presence: true
  has_many :invoices

  def save
    self.full_name = self.first_name unless self.first_name.empty?
    self.full_name += " #{self.last_name }" unless self.last_name.empty?
    super
  end


  # .each { |invoice|  invoice.invoice_line_items.destroy_all}
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
      # byebug

      # invoice_total = invoice.invoice_line_items.sum(:price)
    }
      return {
        paid_invoices_total: paid_invoices_total,
        unpaid_invoices_total: unpaid_invoices_total
      }
    
  end
  # 'pending', overdue
  def paid_invoices_total
    
  end



end
