class CreateCurriculums < ActiveRecord::Migration[5.1]
  def change
    create_table :curriculums do |t|
      t.string :name, null: false, default: ""
      t.integer :course_number, null: false, default: 1

      t.belongs_to :department, null: false

      t.timestamps
    end
  end
end
