class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Usuário logado com sucesso!'
      redirect_to root_path
    else
      flash.now[:error] = 'Algo de errado aconteceu com seu Login'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Usuário desconectado.'
    redirect_to login_path
  end
end
