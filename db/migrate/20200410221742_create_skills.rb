class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name, null: false, default: ""
      t.string :level, null: false, default: ""

      t.belongs_to :working_program, null: false

      t.timestamps
    end
  end
end
