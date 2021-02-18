module V1
  class MessagesController < ApiController
    skip_before_action :authenticate_user_from_token!, only: [:index]
    def index
      render json: Message.all, each_serializer: V1::MessageSerializer
    end
    def create
      @message = Message.new message_params
      if @message.save!
        render json: @message, serializer: V1::MessageSerializer, root: nil
      else
        render json: { error: t('message_create_error') }, status: :unprocessable_entity
      end
    end

    private
    def message_params
      params.require(:message).permit(:content, :sender_id, :recipient_id)
    end
  end
end