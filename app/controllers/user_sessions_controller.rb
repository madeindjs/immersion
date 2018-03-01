# template from https://www.sitepoint.com/rails-authentication-with-authlogic/
class UserSessionsController < ApplicationController
  def new
    # if key is present, it's POST query from main website, so we try to identificate
    if params.has_key?(:user_session) and user_session_params.has_key?(:id) and user_session_params.has_key?(:key)
      create_user_session_from_public_key
      # Try to create session
      if @user_session.save
        flash[:success] = "Bonjour #{@user_session.user.firstname}"
        redirect_to @user
      else
        flash[:danger] = "Une erreur est survenue."
        render :new
      end

    else
      @title = "Se connecter"
      @description = "Connexion."

      @user_session = UserSession.new
    end
  end

  def create
    @user_session = UserSession.new user_session_params.to_h

    # Try to create session
    if @user_session.save
      flash[:success] = "Bonjour #{@user_session.user.firstname}!"
      redirect_to @user_session.user
    else
      flash[:danger] = "Une erreur est survenue."
      render :new
    end
  end

  def destroy
    current_user_session.destroy if current_user_session
    flash[:success] = "A bientôt!"
    redirect_to root_path
  end

  private

  def create_user_session_from_public_key
    user = User.find user_session_params['id']
    @user_session = UserSession.new user.to_h if user_session_params['key'] = user.public_login_key
  end

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me, :key, :id)
  end
end
