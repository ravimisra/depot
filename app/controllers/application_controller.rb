class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
	def current_cart
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end
	
  protected
	
	def increment_counter
	  if session[:counter].nil?
		session[:counter] = 0
	  end
	  session[:counter] += 1
	end	
	
	def reset_counter
		session[:counter] = 0
	end	
	
end
