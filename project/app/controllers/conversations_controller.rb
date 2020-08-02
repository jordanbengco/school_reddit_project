class ConversationsController < ApplicationController

    # Gets all the conversations for a user
    def index
        @conversations = current_user.mailbox.conversations
        # there is also mailbox.sentbox, mailbox.inbox, mailbox.trash, etc
    end

    # Show the details of a convo
    def show
        @conversation = current_user.mailbox.conversations.find(params[:id])
    end

    # Create a new convo
    def new
        @recipients = User.all - [current_user] # user shouldnt be able to message themselves
    end

    # Send the message to correct recipient
    def create    
        recipient = User.find(params[:user_id])
        receipt = current_user.send_message(recipient, params[:body], params[:subject])
        redirect_to conversation_path(receipt.conversation)
    end   
    
    
end