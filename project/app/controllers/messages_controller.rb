class MessagesController < ApplicationController
    # Set the conversation for the message
    before_action :set_conversation


    # Replying to a conversation
    def create
        receipt = current_user.reply_to_conversation(@conversation, params[:body])
        redirect_to conversation_path(receipt.conversation)
    end

    private
        def set_conversation
            @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
        end

    
end