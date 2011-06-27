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
    ["1", "2", "3", "4", "5", "6", "7", "8", "A", "B", "C", "D", "E", "F"].each do |i|
      table_row = {:row => i, :vol => "00", :tsp => "00", :cmd1 => "-00", :cmd2 => "-00"}
      @instrument.table_row.build(table_row)
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def create
    @instrument = Instrument.new(params[:instrument])
    @instrument.user = current_user
    @instrument.author = current_user.login if @instrument.author.blank?
    @instrument.table_rows.each do |table_row|
      table_row.instrument = @instrument
    end
    if @instrument.save
      flash[:notice] = "Instrument créer avec succès."
      redirect_to @instrument
    else
      render :action => 'new'
    end
  end
end
