 class DigitalObjectIdentifiersController < ApplicationController
  before_action :set_digital_object_identifier, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]


  # GET /digital_object_identifiers
  # GET /digital_object_identifiers.json
  def index
    @digital_object_identifiers = DigitalObjectIdentifier.all
  end

  # GET /digital_object_identifiers/1
  # GET /digital_object_identifiers/1.json
  def show
      @url = @digital_object_identifier.urls.build
      @comment = @digital_object_identifier.comments.build  #(params[:comment].merge(:user_id => current_user.id))
  end

  # GET /digital_object_identifiers/new
  def new
    @digital_object_identifier = current_user.digital_object_identifiers.build
    @digital_object_identifier.urls << Url.new

  end

  # GET /digital_object_identifiers/1/edit
  def edit
  end

  # POST /digital_object_identifiers
  # POST /digital_object_identifiers.json
  def create
    @digital_object_identifier = current_user.digital_object_identifiers.create(digital_object_identifier_params)

    respond_to do |format|
      if @digital_object_identifier.save
        format.html { redirect_to @digital_object_identifier, notice: 'Digital object identifier was successfully created.' }
        format.json { render action: 'show', status: :created, location: @digital_object_identifier }
      else
        format.html { render action: 'new' }
        format.json { render json: @digital_object_identifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /digital_object_identifiers/1
  # PATCH/PUT /digital_object_identifiers/1.json
  def update
    respond_to do |format|
      if @digital_object_identifier.update(edit_digital_object_identifier_params)
        format.html { redirect_to @digital_object_identifier, notice: 'Digital object identifier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @digital_object_identifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /digital_object_identifiers/1
  # DELETE /digital_object_identifiers/1.json
  def destroy
    @digital_object_identifier.destroy
    respond_to do |format|
      format.html { redirect_to digital_object_identifiers_url }
      format.json { head :no_content }
    end
  end

 
  private
    def correct_user
      @digital_object_identifier = current_user.digital_object_identifiers.find_by(id: params[:id])
      redirect_to root_url if @digital_object_identifier.nil?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_digital_object_identifier
      @digital_object_identifier = DigitalObjectIdentifier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def digital_object_identifier_params
      params.require(:digital_object_identifier).permit(:name, :integer_identifier, :description, urls_attributes: [ :url ] )
    end
    

    def edit_digital_object_identifier_params
      params.require(:digital_object_identifier).permit(:name, :integer_identifier, :description )
    end
end
