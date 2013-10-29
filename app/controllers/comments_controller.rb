class CommentsController < ApplicationController
	before_action :set_digital_object_identifier

	def create
		@comment = @digital_object_identifier.comments.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = "Url Added"
			redirect_to @digital_object_identifier
		end
	end

	private

	def set_digital_object_identifier
    @digital_object_identifier = DigitalObjectIdentifier.find_by( id: params[:digital_object_identifier_id])
    redirect_to root_url if @digital_object_identifier.nil?
  end

	def comment_params
		params.require(:comment).permit(:comment, :digital_object_identifier_id, :user_id )
	end

end
