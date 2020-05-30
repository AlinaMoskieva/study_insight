class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name, null: false, default: ""
      t.belongs_to :institution, null: false

      t.timestamps
    end
  end
end
