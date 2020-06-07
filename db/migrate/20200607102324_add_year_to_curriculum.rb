class AddYearToCurriculum < ActiveRecord::Migration[5.1]
  def change
    add_column :curriculums, :year, :integer
  end
end
