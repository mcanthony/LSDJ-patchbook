class TagsController < ApplicationController
  def index
    @app_title = "Tag cloud - LSDJ Patch Book"
    @tags = Instrument.tag_counts_on(:tags)
  end

  def show
    @app_title = "Instruments tagged with @{params[:id]} - LSDJ Patch Book"
    @instruments = Instrument.page.tagged_with(params[:id])
    render 'instruments/index'
  end
end
