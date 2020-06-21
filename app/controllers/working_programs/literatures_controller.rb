module WorkingPrograms
  class LiteraturesController < ApplicationController
    expose :literature
    expose :literatures, ->{ working_program.literatures }

    expose :working_program

    def create
      literature.working_program = working_program

      if literature.save
        redirect_to working_program, notice: "Literature was successfully created."
      else
        render :new
      end
    end

    def update
      if literature.update(literature_params)
        redirect_to literature.working_program, notice: "Literature was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      literature.destroy
      redirect_to literature.working_program, notice: "Literature was successfully destroyed."
    end

    private

    def literature_params
      params.require(:literature).permit(:name, :link, :resource_type)
    end
  end
end
