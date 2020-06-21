class DisciplineProgramsController < ApplicationController
  expose :discipline_program
  expose :discipline_programs, -> { discipline.discipline_programs }
  expose :custom_sections, -> { discipline_program.custom_sections.includes(:custom_section_units).order(:id) }
  expose :custom_attributes, -> { discipline_program.custom_attributes.order(:id) }

  expose :discipline

  def create
    discipline_program.discipline = discipline

    if discipline_program.save
      redirect_to discipline_program, notice: "Программа дисциплины была успешно созданa"
    else
      render :new
    end
  end

  def update
    if discipline_program.update(discipline_program_params)
      redirect_to discipline_program, notice: "Программа дисциплины была успешно обновленa"
    else
      render :edit
    end
  end

  def destroy
    discipline_program.destroy
    redirect_to discipline_program.discipline, notice: "Программа дисциплины была успешно удаленa"
  end

  private

  def discipline_program_params
    params.require(:discipline_program).permit(:name, :description, :year,
      custom_sections_attributes: [:id, :name, :value, :_destroy,
        custom_section_units_attributes: [:id, :name, :value, :_destroy,
          custom_attributes_attributes: [:id, :name, :value, :_destroy]
        ],
        custom_attributes_attributes: [:id, :name, :value, :_destroy]
      ],
      custom_attributes_attributes: [:id, :name, :value, :_destroy]
    )
  end
end
