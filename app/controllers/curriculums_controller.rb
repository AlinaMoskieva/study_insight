class CurriculumsController < ApplicationController
  expose :curriculum
  expose :curriculums, -> { department.curriculums }

  expose :department
  expose :disciplines, -> { curriculum.disciplines }

  def create
    curriculum.department = department

    if curriculum.save
      redirect_to curriculum, notice: "Учебный план был успешно создан"
    else
      render :new
    end
  end

  def update
    if curriculum.update(curriculum_params)
      redirect_to curriculum, notice: "Учебный план был успешно обновлен"
    else
      render :edit
    end
  end

  def destroy
    curriculum.destroy
    redirect_to curriculum.department, notice: "Учебный план был успешно удален"
  end

  private

  def curriculum_params
    params.require(:curriculum).permit(:name, :course_number)
  end
end
