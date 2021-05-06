class Customer < ApplicationRecord
  belongs_to :business
  validates :first_name, presence: true

  def save
    self.full_name = self.first_name unless self.first_name.empty?
    self.full_name += " #{self.last_name }" unless self.last_name.empty?
    super
  end

  def self.order_if_order(order)
    if order
      order = (%w[asc desc] & [order.downcase])[0] || 'asc'
      self.order("created_at #{order}")
    else
      self
    end
  end

end
