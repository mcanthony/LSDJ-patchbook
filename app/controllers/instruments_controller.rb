# -*- coding: utf-8 -*-
class InstrumentsController < ApplicationController
  before_filter :require_user, :except => [:index, :show, :raw]
  def index
    @instruments = Instrument.page(params[:page])
  end

  def new
    @instrument = Instrument.new
    @instrument.type = params[:type].blank? ? "PULSE" : params[:type]
    @instrument.volume = "3"
    @instrument.play = "ONCE"
    @instrument.envelope = "A8"
    @instrument.wave = "50" if (@instrument.type == "PULSE")
    @instrument.synth_wave = "SIN" if (@instrument.type == "WAVE")
    @instrument.synth_phase = "NORMAL"
    @instrument.synth_start_volume = "10"
    @instrument.synth_start_cutoff = "FF"
    @instrument.synth_start_phase = "00"
    @instrument.synth_start_vshift = "00"
    @instrument.synth_end_volume = "10"
    @instrument.synth_end_cutoff = "FF"
    @instrument.synth_end_phase = "00"
    @instrument.synth_end_vshift = "00"
    @instrument.output = "LR"
    @instrument.length = "UNLIM" if (@instrument.type == "PULSE")
    @instrument.length = "UNLIM" if (@instrument.type == "NOISE")
    @instrument.length = "F" if (@instrument.type == "WAVE")
    @instrument.synth_filter = "LOWP"
    @instrument.synth_q = "0"
    @instrument.synth_dist = "CLIP"
    @instrument.repeat = "0"
    @instrument.speed = "4"
    @instrument.shape = "FF"
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
    @comment = Comment.new
    @comments = Comment.page(params[:page])
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def create
    @instrument = Instrument.new(params[:instrument])
    @instrument.user = current_user
    @instrument.author = current_user.login if @instrument.author.blank?
    @instrument.table_row.each do |table_row|
      table_row.instrument = @instrument
    end
    if @instrument.save
      flash[:notice] = "Instrument créer avec succès."
      redirect_to @instrument
    else
      render :action => 'new'
    end
  end

  def update
    @instrument = Instrument.find(params[:id])
    if @instrument.update_attributes(params[:instrument])
      flash[:notice] = "Instrument updated"
      redirect_to @instrument
    else
      render :action => 'edit'
    end
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    flash[:notice] = "suprimé"
    redirect_to root_url
  end

  def raw
    @instrument = Instrument.find(params[:instrument_id])
    response.headers["Content-Type"] = "text/plain"
    render "raw_instr_#{@instrument.type.downcase}".to_s, :content_type => "text/plain", :layout => false
  end

end
