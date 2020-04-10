class CreateTrainingDirections < ActiveRecord::Migration[5.1]
  def change
    create_table :training_directions do |t|
      t.string :name, null: false, default: ""
      t.belongs_to :educational_institution, null: false

      t.timestamps
    end
  end
end
