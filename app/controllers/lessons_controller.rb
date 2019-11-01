class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    if current_user.teacher? or current_user.student?
      @lessons = Lesson.where(lessons: {user: current_user}).order("date ASC")
    elsif current_user.office? || current_user.admin?
      @lessons = Lesson.all.order("date ASC")
    end
    # @lessons = Lesson.all
    @lessons_calendar = @lessons.map{|lesson| {id: lesson.id, title: lesson.subject, date: lesson.date}}
    # raise @lessons_calendar.to_json.inspect
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show

  end

  # GET /lessons/new
  def new
    if current_user.admin? or current_user.office?
      @lesson = Lesson.new
      @teachers = User.where(role: 2)
      @students = User.where(role: 3)
    else
      redirect_to root_path if current_user.teacher? || current_user.student?
    end
  end

  # GET /lessons/1/edit
  def edit
    if current_user.office?
      @lesson = Lesson.new
      @teachers = User.where(role: 2)
      @students = User.where(role: 3)
    else
      redirect_to lesson_path if current_user.student?
      @teachers = User.where(role: 2)
      @students = User.where(role: 3)
    end
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params.except(:teachers, :students))
    @teachers = User.where(role: 2)
    @students = User.where(role: 3)
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    @teachers = User.where(role: 2)
    @students = User.where(role: 3)

    respond_to do |format|
      if @lesson.update(lesson_params.except(:teachers, :students))
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.js
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    redirect_to lesson_path if current_user.teacher?
    @teachers = User.where(role: 2)
    @students = User.where(role: 3)
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:date, :subject, :description, :user_id, :course_id, :lesson_status_id, :teachers, :students)
    end
end
