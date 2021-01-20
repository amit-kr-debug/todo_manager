class UsersController < ApplicationController
  def index
    render plain: Users.all.map { |user| user.to_pleasant_string }.join("\n")
  end

end
