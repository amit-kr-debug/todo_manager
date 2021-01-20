class User < ActiveRecord::Base
  def to_pleasant_string
    "Name - #{name}   Email:- #{email}"
  end
end
