class AuthorsController < ApplicationController
  def index
    @authors = Instrument.all.map{|ins| ins.author}.sort!.uniq!
    @app_title = "Authors - LSDJ Patch Book"
  end
  def show
    @instruments = Instrument.page(params[:page]).where(:author => params[:id])
    @app_title = "Author #{params[:id]} - LSDJ Patch Book"
    render 'instruments/index'
  end
end
