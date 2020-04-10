class EducationalInstitutionsController < ApplicationController
  expose :educational_institutions, -> { EducationalInstitution.all }
  expose :educational_institution

  expose :training_directions, ->{ educational_institution.training_directions }

  def create
    if educational_institution.save
      redirect_to educational_institution, notice: "Educational institution was successfully created."
    else
      render :new
    end
  end

  def update
    if educational_institution.update(educational_institution_params)
      redirect_to educational_institution, notice: "Educational institution was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    educational_institution.destroy
    redirect_to educational_institutions_url, notice: "Educational institution was successfully destroyed."
  end

  private

  def educational_institution_params
    params.require(:educational_institution).permit(:name)
  end
end
