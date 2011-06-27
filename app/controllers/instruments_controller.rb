# -*- coding: utf-8 -*-
class InstrumentsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  def index
    @instruments = Instrument.page(params[:page])
  end

  def new
    @instrument = Instrument.new
    @instrument.type = params[:type].blank? ? "PULSE" : params[:type]
    @instrument.envelope = "A8"
    @instrument.wave = "50"
    @instrument.output = "LR"
    @instrument.length = "UNLIM"
    @instrument.sweep = "FF"
    @instrument.vib_type = "HF"
    @instrument.pu2_tune = "00"
    @instrument.pu_fine = "0"
    @instrument.automate = "OFF"
    @instrument.table = "OFF"
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def create
    @instrument = Instrument.new(params[:instrument])
    @instrument.user = current_user
    @instrument.author = current_user.login if @instrument.author.blank?
    if @instrument.save
      flash[:notice] = "Instrument créer avec succès."
      redirect_to @instrument
    else
      render :action => 'new'
    end
  end
end
