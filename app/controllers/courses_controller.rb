class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  # GET /courses
  api :GET, '/courses', 'Lista todas as disciplinas'
  def index
    @courses = Course.all

    render json: @courses
  end

  # GET /courses/1
  api :GET, '/courses/:id', 'Mostra detalhes de uma disciplina'

  def show
    render json: @course
  end

  # POST /courses
  api :POST, "/courses", "Cria uma disciplina"
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  api :PUT, "/courses/:id", "Atualiza uma disciplina"
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  api :DELETE, "/courses/:id", "Deleta uma disciplina"

  def destroy
    @course.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.require(:course).permit(:period, :name, :content, :weekTime, :totalTime, :kind, :teacher)
  end
end
