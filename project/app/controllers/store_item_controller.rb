class StoreItemController < ApplicationController

	def buy
	

		user = User.find_by_id(session[:user_id])
		logger.debug user.inspect
		logger.debug user.store_items.inspect	
		logger.debug "Number of store items bought: "
		logger.debug user.store_items.size 
		
		@store_item = user.store_items.create(name: "testStoreItem")
		
		if user.store_items.any?{|item| item.name = @store_item.name}
			flash.now[:alert] = "You already own that item!"
			logger.debug "DUPLICATE ITEM"			
			return
		end
		
		
		logger.debug "NEW ITEM BOUGHT"	
		
		respond_to do |format|
		  if @store_item.save
			format.html { redirect_to store_url, notice: 'Item was successfully bought and added to the current user' }
		  else
			format.html { render :new }
		  end
		end		
		 
	 
	end


end
