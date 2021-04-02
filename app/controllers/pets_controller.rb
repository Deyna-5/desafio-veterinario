class PetsController < ApplicationController
  before_action :find_client

  # GET /pets or /pets.json
  def index
    @pets = @client.pets
  end

  # GET /pets/1 or /pets/1.json
  def show
    @pet = Pet.find(params[:id])
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
    @pet = Pet.find(params[:id])
  end

  # POST /pets or /pets.json
  def create
    @pet = Pet.new(pet_params)
    @pet.client = @client

    respond_to do |format|
      if @pet.save
        format.html { redirect_to root_path, notice: 'Mascota fue Creada correctamente.'}
      else
        format.html { render :new}
      end
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to root_path, notice: "Pet was successfully updated." }
      else
        format.html { render :edit}
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Mascota eliminada con exito" }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:name, :race, :birthday, pet_histories_attributes: [:id, :weight, :heigth, :description, :pet_id])
    end

    def find_client
      @client = Client.find params[:client_id]
    end
end
