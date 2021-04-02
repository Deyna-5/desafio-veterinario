class PetHistoriesController < ApplicationController
  before_action :find_pet
  before_action :find_client

  # GET /pet_histories or /pet_histories.json
  def index
    @pet_histories = @pet.pet_histories
  end

  # GET /pet_histories/1 or /pet_histories/1.json
  def show
    @pet_history = PetHistory.find(params[:id])
  end

  # GET /pet_histories/new
  def new
    @pet_history = PetHistory.new
  end

  # GET /pet_histories/1/edit
  def edit
    @pet_history = PetHistory.find(params[:id])
  end

  # POST /pet_histories or /pet_histories.json
  def create
    @pet_history = PetHistory.new(pet_history_params)

    respond_to do |format|
      if @pet_history.save
        format.html { redirect_to root_path, notice: "Historia creada con exito" }
      else
        format.html { render :new}
      end
    end
  end

  # PATCH/PUT /pet_histories/1 or /pet_histories/1.json
  def update
    respond_to do |format|
      if @pet_history.update(pet_history_params)
        format.html { redirect_to root_path notice: "Pet history was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_histories/1 or /pet_histories/1.json
  def destroy
    @pet_history.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Pet history was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def find_pet
      @pet = Pet.find params[:pet_id]
    end

    def find_client
      @client = Client.find params[:client_id]
    end

    # Only allow a list of trusted parameters through.
    def pet_history_params
      params.require(:pet_history).permit(:weight, :height, :description, :pet_id)
    end
end
