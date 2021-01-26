class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :todos
  has_secure_password

  def to_pleasant_string
    "Name - #{name}   Email:- #{email}"
  end

  def self.auth?(email, password)
    find_by(email: email, password: password)
  end
end
