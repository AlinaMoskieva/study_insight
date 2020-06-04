class DisciplinesController < ApplicationController
  expose :discipline
  expose :disciplines, -> { curriculum.disciplines }

  expose :curriculum

  def create
    discipline.curriculum = curriculum

    if discipline.save
      redirect_to discipline, notice: "Дисциплина был успешно созданa"
    else
      render :new
    end
  end

  def update
    if discipline.update(discipline_params)
      redirect_to discipline, notice: "Дисциплина был успешно обновленa"
    else
      render :edit
    end
  end

  def destroy
    discipline.destroy
    redirect_to discipline.curriculum, notice: "Дисциплина был успешно удаленa"
  end

  private

  def discipline_params
    params.require(:discipline).permit(:name, :course_number)
  end
end
