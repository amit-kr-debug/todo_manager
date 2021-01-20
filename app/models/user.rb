class User < ActiveRecord::Base
  def to_pleasant_string
    "Name - #{name}   Email:- #{email}"
  end

  def self.auth?(email, password)
    find_by(email: email, password: password)
  end
end
