class UniversitiesController < ApplicationController
  expose :university
  expose :universities, -> { University.all }
  expose :institutions, -> { university.institutions }

  def create
    if university.save
      redirect_to university, notice: "Университет успешно создан"
    else
      render :new
    end
  end

  def update
    if university.update(university_params)
      redirect_to university, notice: "Университет успешно обновлен"
    else
      render :edit
    end
  end

  def destroy
    university.destroy
    redirect_to universities_url, notice: "Университет успешно удален"
  end

  private

  def university_params
    params.require(:university).permit(:name)
  end
end
