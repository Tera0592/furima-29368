class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end
end
