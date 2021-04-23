class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: {case_sensitive: false},format:{ with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i,
    message: "invalid email" }
  validates :first_name, length: {minimum: 1}
  validates :last_name, presence: true
  validates :password, confirmation: true, format:{ with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}\z/,message: "password must contain minimum eight characters, at least one uppercase letter, one lowercase letter and one number"}
  validates :password_confirmation, presence: true


end
