class TagsController < ApplicationController
  def index
    @tags = Instrument.tag_counts_on(:tags)
  end
end
