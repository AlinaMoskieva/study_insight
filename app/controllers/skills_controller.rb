class SkillsController < ApplicationController
  expose :skill
  expose :skills, ->{ working_program.skills }

  expose :working_program

  def create
    skill.working_program = working_program

    if skill.save
      redirect_to working_program, notice: "Skill was successfully created."
    else
      render :new
    end
  end

  def update
    if skill.update(skill_params)
      redirect_to skill.working_program, notice: "Skill was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    skill.destroy
    redirect_to skill.working_program, notice: "Skill was successfully destroyed."
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :level)
  end
end
