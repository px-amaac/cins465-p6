class UrlsController < ApplicationController
	before_action :set_digital_object_identifier

	def create
		@url = @digital_object_identifier.urls.build(url_params)
		if @url.save
			flash[:success] = "Url Added"
			redirect_to root_url
		end
	end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_digital_object_identifier
    @digital_object_identifier = current_user.digital_object_identifiers.find(params[:digital_object_identifier_id])
    redirect_to root_url if @digital_object_identifier.nil?
  end

	def url_params
      params.require(:url).permit(:url, :digital_object_identifier_id )
   end
end
