class DisciplineProgramsController < ApplicationController
  expose :discipline_program
  expose :discipline_programs, -> { discipline.discipline_programs }

  expose :discipline

  def create
    discipline_program.discipline = discipline

    if discipline_program.save
      redirect_to discipline_program, notice: "Дисциплина был успешно созданa"
    else
      render :new
    end
  end

  def update
    if discipline_program.update(discipline_program_params)
      redirect_to discipline_program, notice: "Дисциплина был успешно обновленa"
    else
      render :edit
    end
  end

  def destroy
    discipline_program.destroy
    redirect_to discipline_program.discipline, notice: "Дисциплина был успешно удаленa"
  end

  private

  def discipline_program_params
    params.require(:discipline_program).permit(:name, :year, :description)
  end
end
