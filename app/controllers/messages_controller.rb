class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @to = User.find(params[:acts_as_messageable_message][:to])
    @from = User.find(params[:acts_as_messageable_message][:from])
    User.find(@from).send_message(@to, :body => params[:acts_as_messageable_message][:body])
    redirect_to (:back)
  end

end
