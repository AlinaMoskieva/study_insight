class SpecialitiesController < ApplicationController
  expose :speciality
  expose :specialities, ->{ educational_institution.specialities }

  expose :educational_institution
  expose :disciplines, ->{ speciality.disciplines }

  def create
    speciality.educational_institution = educational_institution

    if speciality.save
      redirect_to speciality, notice: "Speciality was successfully created."
    else
      render :new
    end
  end

  def update
    if speciality.update(speciality_params)
      redirect_to speciality, notice: "Speciality was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    speciality.destroy
    redirect_to speciality.educational_institution, notice: "Speciality was successfully destroyed."
  end

  private

  def speciality_params
    params.require(:speciality).permit(:name)
  end
end
