class WorkingProgramsController < ApplicationController
  expose :working_program

  expose :skills, -> { working_program.skills }
  expose :competences, -> { working_program.competences }
  expose :program_modules, ->{ working_program.program_modules.order(:number) }
  expose :required_literatures, ->{ working_program.literatures.required }
  expose :optional_literatures, ->{ working_program.literatures.optional }
  expose :web_literatures, ->{ working_program.literatures.web }

  expose :working_programs, ->{ discipline.working_programs }

  expose :discipline

  def create
    working_program.discipline = discipline

    if working_program.save
      redirect_to working_program, notice: "Working program was successfully created."
    else
      render :new
    end
  end

  def update
    if working_program.update(working_program_params)
      redirect_to working_program, notice: "Working program was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    working_program.destroy
    redirect_to working_program.discipline, notice: "Working program was successfully destroyed."
  end

  private

  def working_program_params
    params.require(:working_program).permit(:start_at, :developed_at, :developed_in, :language,
      :adapt_to_needs_of_disabilities)
  end
end
