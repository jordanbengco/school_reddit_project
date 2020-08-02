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
    
end