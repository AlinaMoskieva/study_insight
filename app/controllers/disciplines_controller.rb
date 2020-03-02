class DisciplinesController < ApplicationController
  expose :discipline
  expose :disciplines, ->{ specialitiy.discipline }

  expose :speciality

  def create
    discipline.speciality = speciality

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
    redirect_to discipline.speciality, notice: "Discipline was successfully destroyed."
  end

  private

  def discipline_params
    params.require(:discipline).permit(:name)
  end
end
