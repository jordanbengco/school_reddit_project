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
    @user = User.find_by_slug(params[:slug])
    @blacklist = @user.blacklists.create(blacklist_params)

    if @blacklist.save
      redirect_to @blacklist
    else
      render 'new'
    end
  end
 
  # def update
  #   @blacklist = Blacklist.find(params[:id])
 
  #   if @blacklist.update(blacklist_params)
  #     redirect_to @blacklist
  #   else
  #     render 'edit'
  #   end
  # end
 
  # def destroy
  #   @blacklist = Blacklist.find(params[:id])
  #   @blacklist.destroy
 
  #   redirect_to root_path
  # end
 
  private
    def blacklist_params
      params.require(:blacklist).permit(:blocked)
    end


end