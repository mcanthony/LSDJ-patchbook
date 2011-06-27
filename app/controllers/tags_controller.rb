class TagsController < ApplicationController
  def index
    @app_title = "Tag cloud - LSDJ Patch Book"
    @tags = Instrument.tag_counts_on(:tags)
  end

  def show
    @app_title = "Instruments tagged with @{params[:id]} - LSDJ Patch Book"
    @instruments = Instrument.page.tagged_with(params[:id])
    @is_filter_tag = true
    respond_to do |format|
      format.html { render 'instruments/index' }
      format.atom { render 'instruments/index', :layout => false }
    end
  end
end
