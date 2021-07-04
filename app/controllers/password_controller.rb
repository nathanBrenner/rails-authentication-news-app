class PasswordController < ApplicationController
  def reset
    token = request.query_parameters['token'] or params['token'] or not_found
    @user = User.find_by_reset(token) # why is this returning nil? It works if I hardcode the token in, the token is there, if I debug it, I get back the user from the table, but this always fails because user comes back as nill
    if params['password'] and @user
      @user.password = params['password']
      if @user.save
        render plain: 'Successful reset password'
      else
        render plain: 'error'
      end
    end
    # render plain: token
  end

  def forgot
    # 40dcbd77c65ad248743d
    if params['email']
      user = User.find_by_email(params['email'])
      if user
        token = SecureRandom.hex(10)
        user.reset = token
        user.save
        ResetMailer.with(user: @user).reset_password
      end
      
      render plain: 'A link to reset your password has been sent to that email.'

    end
  end

  def not_found
    # raise ApplicationController::RoutingError.new('Not Found')
    'not found'
  end
end
