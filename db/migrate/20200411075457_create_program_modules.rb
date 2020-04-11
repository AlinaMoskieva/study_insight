class CreateProgramModules < ActiveRecord::Migration[5.1]
  def change
    create_table :program_modules do |t|
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.integer :number, default: 1

      t.belongs_to :working_program, null: false

      t.timestamps
    end
  end
end
