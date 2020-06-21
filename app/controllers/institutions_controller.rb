class InstitutionsController < ApplicationController
  expose :institution
  expose :institutions, -> { university.institutions }

  expose :university
  expose :departments, -> { institution.departments }

  def create
    institution.university = university

    if institution.save
      redirect_to institution, notice: "Институт был успешно создан"
    else
      render :new
    end
  end

  def update
    if institution.update(institution_params)
      redirect_to institution, notice: "Институт был успешно обновлен"
    else
      render :edit
    end
  end

  def destroy
    institution.destroy
    redirect_to institution.university, notice: "Институт был успешно удален"
  end

  private

  def institution_params
    params.require(:institution).permit(:name)
  end
end
