class BlacklistsController < ApplicationController

    def index
        @blacklists = Blacklist.all
      end
     
      def show
        @blacklist = Blacklist.find(params[:id])
      end
     
      def new
        @blacklist = Blacklist.new
      end
     
      def edit
        @blacklist = Blacklist.find(params[:id])
      end
     
      def create
        @blacklist = Blacklist.new(article_params)
     
        if @blacklist.save
          redirect_to @blacklist
        else
          render 'new'
        end
      end
     
      def update
        @blacklist = Blacklist.find(params[:id])
     
        if @blacklist.update(blacklist_params)
          redirect_to @blacklist
        else
          render 'edit'
        end
      end
     
      def destroy
        @blacklist = Blacklist.find(params[:id])
        @blacklist.destroy
     
        redirect_to blacklists_path
      end
     
      private
        def blacklist_params
          params.require(:article).permit(:blocked)
        end
  
    


end
