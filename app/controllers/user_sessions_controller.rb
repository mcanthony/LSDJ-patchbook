# -*- coding: utf-8 -*-
class UserSessionsController < ApplicationController

  def new
    @app_title = "New session - LSDJ Patch Book"
    @user_session = UserSession.new
  end

  def create
    @app_title = "New session - LSDJ Patch Book"
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Connecté."
      redirect_to root_url
    else
      flash[:notice] = "Erreur lors de la connexion, réssayez."
      render 'new'
    end
  end

  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = "Déconnecté."
    redirect_to root_url
  end
end
