class DisciplinesController < ApplicationController
  expose_decorated :discipline
  expose :disciplines, ->{ specialitiy.discipline }

  expose :training_direction

  def create
    discipline.training_direction = training_direction

    if discipline.save
      redirect_to discipline, notice: "Discipline was successfully created."
    else
      render :new
    end
  end

  def update
    if discipline.update(discipline_params)
      redirect_to discipline, notice: "Discipline was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    discipline.destroy
    redirect_to discipline.training_direction, notice: "Discipline was successfully destroyed."
  end

  private

  def discipline_params
    params.require(:discipline).permit(:name, :description, :course_number)
  end
end
