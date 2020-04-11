module WorkingPrograms
  class CompetencesController < ApplicationController
    expose :competence
    expose :competences, ->{ working_program.competences }

    expose :working_program

    def create
      competence.working_program = working_program

      if competence.save
        redirect_to working_program, notice: "Competence was successfully created."
      else
        render :new
      end
    end

    def update
      if competence.update(competence_params)
        redirect_to competence.working_program, notice: "Competence was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      competence.destroy
      redirect_to competence.working_program, notice: "Competence was successfully destroyed."
    end

    private

    def competence_params
      params.require(:competence).permit(:description, :cipher)
    end
  end
end
