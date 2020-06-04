class CreateDisciplinePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :discipline_programs do |t|
      t.string :name, null: false
      t.integer :year, null: false
      t.string :description, null: false

      t.belongs_to :discipline, null: false

      t.timestamps
    end
  end
end
