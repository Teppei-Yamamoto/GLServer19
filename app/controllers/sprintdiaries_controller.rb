class SprintdiariesController < ApplicationController
  before_action :set_sprintdiary, only: [:show, :edit, :update, :destroy]

  # GET /sprintdiaries
  # GET /sprintdiaries.json
  def index
    @sprintdiaries = Sprintdiary.all
  end

  # GET /sprintdiaries/1
  # GET /sprintdiaries/1.json
  def show
  end

  # GET /sprintdiaries/new
  def new
    @sprintdiary = Sprintdiary.new
  end

  # GET /sprintdiaries/1/edit
  def edit
  end

  # POST /sprintdiaries
  # POST /sprintdiaries.json
  def create
    @sprintdiary = Sprintdiary.new(sprintdiary_params)

    respond_to do |format|
      if @sprintdiary.save
        format.html { redirect_to @sprintdiary, notice: 'Sprintdiary was successfully created.' }
        format.json { render :show, status: :created, location: @sprintdiary }
      else
        format.html { render :new }
        format.json { render json: @sprintdiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprintdiaries/1
  # PATCH/PUT /sprintdiaries/1.json
  def update
    respond_to do |format|
      if @sprintdiary.update(sprintdiary_params)
        format.html { redirect_to @sprintdiary, notice: 'Sprintdiary was successfully updated.' }
        format.json { render :show, status: :ok, location: @sprintdiary }
      else
        format.html { render :edit }
        format.json { render json: @sprintdiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprintdiaries/1
  # DELETE /sprintdiaries/1.json
  def destroy
    @sprintdiary.destroy
    respond_to do |format|
      format.html { redirect_to sprintdiaries_url, notice: 'Sprintdiary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprintdiary
      @sprintdiary = Sprintdiary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprintdiary_params
      params.require(:sprintdiary).permit(:surum_menber_id, :bdiary)
    end
end
