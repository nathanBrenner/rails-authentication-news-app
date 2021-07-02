class HomeController < ApplicationController
  def index
    p params
  end

  def login
    @params = params
    if params['username']
      user = User.find_by_username(params['username'])
      @valid = user.authenticate(params['password'])
    end

  end
  

end
