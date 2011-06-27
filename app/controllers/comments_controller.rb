class CommentsController < ApplicationController
  before_filter :require_user

  def create
    @comment = Comment.new(params[:comment])
    @instrument = Instrument.find(params[:instrument_id])
    @comment.user = current_user
    @comment.instrument = @instrument
    if @comment.save
      flash[:notice] = "saved"
      redirect_to @instrument
    else
      redirect_to @instrument
    end
  end
end
