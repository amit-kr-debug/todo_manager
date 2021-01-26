class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    user = User.create!(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
    )
    session[:current_user_id] = user.id
    redirect_to todos_path
  end

  def login
    user_email = params[:email]
    password = params[:password]
    render plain: User.auth?(user_email, password) ? true : false
  end
end
