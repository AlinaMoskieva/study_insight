class DepartmentsController < ApplicationController
  expose :department
  expose :departments, -> { institution.departments }

  expose :institution
  expose :curriculumns, -> { department.curriculums.order(:name, year: :desc) }

  def create
    department.institution = institution

    if department.save
      redirect_to department, notice: "Направление было успешно создан"
    else
      render :new
    end
  end

  def update
    if department.update(department_params)
      redirect_to department, notice: "Направление было успешно обновлен"
    else
      render :edit
    end
  end

  def destroy
    department.destroy
    redirect_to department.institution, notice: "Направление было успешно удален"
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end
