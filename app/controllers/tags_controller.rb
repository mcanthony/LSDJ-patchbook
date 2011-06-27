class TagsController < ApplicationController
  def index
    @tags = Instrument.tag_counts_on(:tags)
  end

  def show
    @instruments = Instrument.page.tagged_with(params[:id])
    render 'instruments/index'
  end
end
