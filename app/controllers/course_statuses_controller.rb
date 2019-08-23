class CourseStatusesController < ApplicationController
  before_action :set_course_status, only: [:show, :edit, :update, :destroy]

  # GET /course_statuses
  # GET /course_statuses.json
  def index
    @course_statuses = CourseStatus.all
  end

  # GET /course_statuses/1
  # GET /course_statuses/1.json
  def show
  end

  # GET /course_statuses/new
  def new
    @course_status = CourseStatus.new
  end

  # GET /course_statuses/1/edit
  def edit
  end

  # POST /course_statuses
  # POST /course_statuses.json
  def create
    @course_status = CourseStatus.new(course_status_params)

    respond_to do |format|
      if @course_status.save
        format.html { redirect_to @course_status, notice: 'Course status was successfully created.' }
        format.json { render :show, status: :created, location: @course_status }
      else
        format.html { render :new }
        format.json { render json: @course_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_statuses/1
  # PATCH/PUT /course_statuses/1.json
  def update
    respond_to do |format|
      if @course_status.update(course_status_params)
        format.html { redirect_to @course_status, notice: 'Course status was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_status }
      else
        format.html { render :edit }
        format.json { render json: @course_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_statuses/1
  # DELETE /course_statuses/1.json
  def destroy
    @course_status.destroy
    respond_to do |format|
      format.html { redirect_to course_statuses_url, notice: 'Course status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_status
      @course_status = CourseStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_status_params
      params.require(:course_status).permit(:name, :description)
    end
end
