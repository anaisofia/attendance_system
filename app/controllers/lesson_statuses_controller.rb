class LessonStatusesController < ApplicationController
  before_action :set_lesson_status, only: [:show, :edit, :update, :destroy]

  # GET /lesson_statuses
  # GET /lesson_statuses.json
  def index
    @lesson_statuses = LessonStatus.all
  end

  # GET /lesson_statuses/1
  # GET /lesson_statuses/1.json
  def show
  end

  # GET /lesson_statuses/new
  def new
    @lesson_status = LessonStatus.new
  end

  # GET /lesson_statuses/1/edit
  def edit
  end

  # POST /lesson_statuses
  # POST /lesson_statuses.json
  def create
    @lesson_status = LessonStatus.new(lesson_status_params)

    respond_to do |format|
      if @lesson_status.save
        format.html { redirect_to @lesson_status, notice: 'Lesson status was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_status }
      else
        format.html { render :new }
        format.json { render json: @lesson_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_statuses/1
  # PATCH/PUT /lesson_statuses/1.json
  def update
    respond_to do |format|
      if @lesson_status.update(lesson_status_params)
        format.html { redirect_to @lesson_status, notice: 'Lesson status was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_status }
      else
        format.html { render :edit }
        format.json { render json: @lesson_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_statuses/1
  # DELETE /lesson_statuses/1.json
  def destroy
    @lesson_status.destroy
    respond_to do |format|
      format.html { redirect_to lesson_statuses_url, notice: 'Lesson status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_status
      @lesson_status = LessonStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_status_params
      params.require(:lesson_status).permit(:name)
    end
end
