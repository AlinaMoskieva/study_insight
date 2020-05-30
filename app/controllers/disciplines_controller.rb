class DisciplinesController < ApplicationController
  expose :discipline
  expose :disciplines, -> { curriculum.disciplines }

  expose :curriculum

  def create
    if discipline.save
      redirect_to discipline, notice: "Дисциплина был успешно создан"
    else
      render :new
    end
  end

  def update
    if discipline.update(discipline_params)
      redirect_to discipline, notice: "Дисциплина был успешно обновлен"
    else
      render :edit
    end
  end

  def destroy
    discipline.destroy
    redirect_to disciplines_url, notice: "Дисциплина был успешно удален"
  end

  private

  def discipline_params
    params.require(:discipline).permit(:name, :course_number)
  end
end
