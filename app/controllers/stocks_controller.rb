class StocksController < ApplicationController

	def search
		if params[:stock].blank?
			flash.now[:danger] = "Please specify a stock to search."
		else
			@stock = Stock.new_from_lookup(params[:stock])
			flash.now[:danger] = "That is not a valid stock symbol." unless @stock
		end
		respond_to do |format|
			format.js { render partial: 'users/result'}
		end
	end

end