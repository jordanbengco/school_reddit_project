class StoreItemController < ApplicationController
	def isItemOwnedByUser
	
	end

	

	def buy
		user = User.find_by_id(session[:user_id])
		logger.debug user.inspect
		logger.debug user.store_items.inspect	
		logger.debug "Number of store items bought: "
		logger.debug user.store_items.size 
		
		if user.store_items.any?{|item| item.name = "testStoreItem"}
			flash.now[:alert] = "You already own that item!"
			logger.debug "DUPLICATE ITEM"
			render js: "alert('Item already owned');"
			return			
		end
		
		
	
		@store_item = user.store_items.create(name: "testStoreItem", description: "test description", cost:10)		
		respond_to do |format|
		  if @store_item.save
		  	logger.debug "NEW ITEM BOUGHT"
			format.html { redirect_to store_url, notice: 'Item purchased and added to the current user' }
		  else
			format.html { render :new }
		  end
		end		
		 
	end

end
