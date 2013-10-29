class HomeController < ApplicationController

	def index
		if params[:search]
			@doi = DigitalObjectIdentifier.search(params[:search]).order("created_at DESC")
		end
	end
end
