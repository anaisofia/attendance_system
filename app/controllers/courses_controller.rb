class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    if current_user.teacher? or current_user.student?
      @courses = Course.joins(:lessons).where(lessons: {user: current_user}).order("name ASC")
    elsif current_user.office? || current_user.admin?
      @courses = Course.all.order("name ASC")
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    redirect_to root_path if current_user.teacher? && !@course.users.include?(current_user)
    @lessons = Lesson.where(course_id: (params[:id])).order('date DESC')
  end

  # GET /courses/new
  def new
    if current_user.admin? or current_user.office?
      @course = Course.new
      @teachers = User.where(role: 2)
      @students = User.where(role: 3)
    else
      redirect_to root_path if current_user.teacher?
    end

  end

  # GET /courses/1/edit
  def edit
    if current_user.office?
      @course = Course.new
      @teachers = User.where(role: 2)
      @students = User.where(role: 3)
    else
      redirect_to course_path if current_user.teacher?
      @teachers = User.where(role: 2)
      @students = User.where(role: 3)
    end
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params.except(:teachers, :students))
    respond_to do |format|
      if @course.save

        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @teachers = User.where(role: 2)
    @students = User.where(role: 3)

    respond_to do |format|
      if @course.update(course_params.except(:teachers, :students))
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :course_level_id, :course_status_id, :meetingDay, :start_time, :end_time, :address, :info, :user, :teachers, :students)
    end
end
