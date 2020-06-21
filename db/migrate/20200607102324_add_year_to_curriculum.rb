class AddYearToCurriculum < ActiveRecord::Migration[5.1]
  def change
    add_column :curriculums, :year, :integer
    remove_column :curriculums, :course_number, :integer
  end
end
