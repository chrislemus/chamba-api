class User < ApplicationRecord
  has_secure_password
  has_one :business, :foreign_key => 'owner_id'
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :events
  validates :business_name, presence: true
  validates :email, confirmation: true, presence: true, uniqueness: {case_sensitive: false},format:{ with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i,
    message: "invalid email" }
  validates :password, confirmation: true, presence: true, format:{ with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}\z/,message: "password must contain minimum eight characters, at least one uppercase letter, one lowercase letter and one number"}

  def full_name
    full_name = ''
    full_name = self.first_name unless self.first_name.empty?
    full_name += " #{self.last_name }" unless self.last_name.empty?
    full_name
  end
end
