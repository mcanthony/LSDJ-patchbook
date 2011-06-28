# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_filter :require_user, :except => [:show, :new, :create, :index]

  def index
    @app_title = "Contributors - LSDJ Patch Book"
    @users = User.page(params[:page])
  end

  def new
    @app_title = "New user - LSDJ Patch Book"
    @user = User.new
  end

  def create
    @app_title = "New user - LSDJ Patch Book"
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User created."
      redirect_to @user
    else
      render :action => 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @app_title = "Contributor #{@user.login} - LSDJ Patch Book"
    @authored = @user.instruments.where(:author => @user.login)
    @submitted = @user.instruments.where('author IS NOT ?', @user.login)
    @instruments = @user.instruments
    respond_to do |format|
      format.html
      format.atom { render 'instruments/index', :layout => false }
    end
  end

  def edit
    @app_title = "Edit user - LSDJ Patch Book"
    @user = User.find(params[:id])
    redirect_to root_url if current_user != @user
  end

  def update
    @app_title = "Update user - LSDJ Patch Book"
    @user = User.find(params[:id])

    redirect_to root_url if current_user != @user

    if @user.update_attributes(params[:user])
      flash[:notice] = "User updated."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    redirect_to root_url if current_user != @user
    @user.destroy
    flash[:notice] = "User removed."
    redirect_to root_url
  end

end
