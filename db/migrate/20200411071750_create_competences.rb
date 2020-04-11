class CreateCompetences < ActiveRecord::Migration[5.1]
  def change
    create_table :competences do |t|
      t.string :description, null: false, default: ""
      t.string :cipher, null: false, default: ""

      t.belongs_to :working_program, null: false

      t.timestamps
    end
  end
end
