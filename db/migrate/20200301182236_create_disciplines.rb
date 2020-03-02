class CreateDisciplines < ActiveRecord::Migration[5.1]
  def change
    create_table :disciplines do |t|
      t.string :name, null: false, default: ""
      t.text :description, default: ""
      t.integer :course_number, null: false, default: 1

      t.belongs_to :speciality, null: false

      t.timestamps
    end
  end
end
