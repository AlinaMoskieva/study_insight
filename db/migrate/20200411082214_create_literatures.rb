class CreateLiteratures < ActiveRecord::Migration[5.1]
  def change
    create_table :literatures do |t|
      t.string :name, null: false, default: ""
      t.string :link, default: ""
      t.string :resource_type, default: "required"

      t.belongs_to :working_program, null: false

      t.timestamps
    end
  end
end
