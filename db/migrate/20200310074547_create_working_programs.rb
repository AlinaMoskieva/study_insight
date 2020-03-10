class CreateWorkingPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :working_programs do |t|
      t.date :start_at, null: false
      t.date :developed_at, null: false
      t.string :developed_in, null: false
      t.string :language, null: false, default: ""
      t.string :adapt_to_needs_of_disabilities, null: false, default: ""
      t.belongs_to :discipline, null: false

      t.timestamps
    end
  end
end
