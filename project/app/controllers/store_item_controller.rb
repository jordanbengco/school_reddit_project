class StoreItemController < ApplicationController
	helper_method :store_inventory	
	def store_inventory
		#@store_inventory ||= User.find(session[:user_id])
	end

	def buy
		@name = params[:name]
		@description = params[:description]
		@cost = params[:cost]
		
		logger.debug @name
		logger.debug @description
		logger.debug @cost
		
		user = User.find_by_id(session[:user_id])
		logger.debug user.inspect
		logger.debug user.store_items.inspect	
		logger.debug "Number of store items bought: "
		logger.debug user.store_items.size 
		
		if user.store_items.any?{|item| item.name = "testStoreItem"}
			flash[:notice] = "You already own this item"
			redirect_to store_url
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
