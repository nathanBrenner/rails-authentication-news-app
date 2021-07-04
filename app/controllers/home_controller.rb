class HomeController < ApplicationController
  skip_before_action :authorized, only: [:login, :logout, :index]
  def index
    p params
  end

  def login
    @params = params
    if params['username']
      user = User.find_by_username(params['username'])
      @valid = user && user.authenticate(params['password'])
      if @valid
        session[:user_id] = user.id
        redirect_to '/'
      else
        flash.alert = 'Username or password incorrect'
        redirect_to '/home/login'
      end
    end
  end

  def logout
    session[:user_id] = nil
  end

end
