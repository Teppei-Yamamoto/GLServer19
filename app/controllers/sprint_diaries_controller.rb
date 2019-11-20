class SprintDiariesController < ApplicationController
  before_action :set_sprint_diary, only: [:show, :edit, :update, :destroy]

  # GET /sprint_diaries
  # GET /sprint_diaries.json
  def index
    @scrum_member = ScrumMember.where(:id => params[:scrum_member_id]).first
    @sprint_diaries = @scrum_member.sprint_diaries.all
  end

  # GET /sprint_diaries/1
  # GET /sprint_diaries/1.json
  def show
  end

  # GET /sprint_diaries/new
  def new
    @scrum_member = ScrumMember.where(:id => params[:scrum_member_id]).first
    @sprint_diary = @scrum_member.sprint_diaries.build
  end

  # GET /sprint_diaries/1/edit
  def edit
  end

  # POST /sprint_diaries
  # POST /sprint_diaries.json
  def create
    @scrum_member = ScrumMember.where(:id => params[:scrum_member_id]).first
    @sprint_diary = @scrum_member.sprint_diaries.build(sprint_diary_params)

    respond_to do |format|
      if @sprint_diary.save
        format.html { redirect_to [@scrum_member, @sprint_diary], notice: 'Sprint diary was successfully created.' }
        format.json { render :show, status: :created, location: @sprint_diary }
      else
        format.html { render :new }
        format.json { render json: @sprint_diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprint_diaries/1
  # PATCH/PUT /sprint_diaries/1.json
  def update
    respond_to do |format|
      if @sprint_diary.update(sprint_diary_params)
        format.html { redirect_to [@scrum_member, @sprint_diary], notice: 'Sprint diary was successfully updated.' }
        format.json { render :show, status: :ok, location: @sprint_diary }
      else
        format.html { render :edit }
        format.json { render json: @sprint_diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprint_diaries/1
  # DELETE /sprint_diaries/1.json
  def destroy
    @sprint_diary.destroy
    respond_to do |format|
      format.html { redirect_to scrum_member_sprint_diaries_url, notice: 'Sprint diary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint_diary
      @scrum_member = ScrumMember.where(:id => params[:scrum_member_id]).first
      @sprint_diary = @scrum_member.sprint_diaries.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_diary_params
      params.require(:sprint_diary).permit(:scrum_member_id, :bdiary)
    end
end
