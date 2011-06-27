class AuthorsController < ApplicationController
  def index
    @authors = Instrument.all.map{|ins| ins.author}.sort!.uniq!
    @app_title = "Authors - LSDJ Patch Book"
  end
  def show
    @instruments = Instrument.page(params[:page]).where(:author => params[:id])
    @app_title = "Author #{params[:id]} - LSDJ Patch Book"
    @is_filter_authors = true
    respond_to do |format|
      format.html { render 'instruments/index' }
      format.atom { render 'instruments/index', :layout => false }
    end
  end
end
