class AuthorsController < ApplicationController
  def index
    @authors = Instrument.all.map{|ins| ins.author}.sort!.uniq!
  end
  def show
    @instruments = Instrument.page(params[:page]).where(:author => params[:id])
    render 'instruments/index'
  end
end
