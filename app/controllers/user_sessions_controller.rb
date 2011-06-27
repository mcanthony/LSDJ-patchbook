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
      flash[:notice] = "Connected."
      redirect_to root_url
    else
      flash[:notice] = "Connexion error, please retry."
      render 'new'
    end
  end

  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = "Deconnected."
    redirect_to root_url
  end
end
