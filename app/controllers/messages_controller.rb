class MessagesController < ApiController
  def index
    messages = Message.all # =>追加
    render json: messages  # =>追加
  end
end