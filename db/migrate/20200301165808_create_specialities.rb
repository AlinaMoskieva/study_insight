class CreateSpecialities < ActiveRecord::Migration[5.1]
  def change
    create_table :specialities do |t|
      t.string :name, null: false, default: ""
      t.belongs_to :educational_institution, null: false

      t.timestamps
    end
  end
end
