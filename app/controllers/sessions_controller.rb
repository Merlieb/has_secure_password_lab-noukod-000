<<<<<<< HEAD
class SessionsController < ApplicationController::Base
  def create
    @user = User.find_by(username: params[:username])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
=======
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    user = user.try(:authenticate, params[:user][:password])

    return redirect_to(controller: 'sessions', action: 'new') unless user

    session[:user_id] = user.id

    @user = user

    redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
>>>>>>> e385d031dc3568625c075a3b9c0739a1ac6133f8
  end
end
