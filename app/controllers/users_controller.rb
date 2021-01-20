class UsersController < ApplicationController
  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    user_name = params[:name]
    user_email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: user_name,
      email: user_email,
      password: password,
    )
    response_text = "Hey #{user_name}, you have been successfully added"
    render plain: response_text
  end
end
