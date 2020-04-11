module WorkingPrograms
  class ProgramModulesController < ApplicationController
    expose :program_module
    expose :program_modules, ->{ working_program.program_modules }

    expose :working_program

    def create
      program_module.working_program = working_program

      if program_module.save
        redirect_to working_program, notice: "Program Module was successfully created."
      else
        render :new
      end
    end

    def update
      if program_module.update(program_module_params)
        redirect_to program_module.working_program, notice: "Program Module was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      program_module.destroy
      redirect_to program_module.working_program, notice: "Program Module was successfully destroyed."
    end

    private

    def program_module_params
      params.require(:program_module).permit(:name, :description, :number)
    end
  end
end
