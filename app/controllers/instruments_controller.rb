class InstrumentsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  def index
    @instruments = Instrument.page(params[:page])
  end

  def new
    @instrument = Instrument.new
    @instrument.type = params[:type].blank? ? "PULSE" : params[:type]
  end
end
