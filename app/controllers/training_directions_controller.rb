class TrainingDirectionsController < ApplicationController
  expose :training_direction
  expose :training_directions, ->{ educational_institution.training_directions }

  expose :educational_institution
  expose :disciplines, ->{ training_direction.disciplines }

  def create
    training_direction.educational_institution = educational_institution

    if training_direction.save
      redirect_to training_direction, notice: "Training direction was successfully created."
    else
      render :new
    end
  end

  def update
    if training_direction.update(training_direction_params)
      redirect_to training_direction, notice: "Training direction was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    training_direction.destroy
    redirect_to training_direction.educational_institution, notice: "Training direction was successfully destroyed."
  end

  private

  def training_direction_params
    params.require(:training_direction).permit(:name)
  end
end
