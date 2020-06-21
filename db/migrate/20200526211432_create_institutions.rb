class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name, null: false, default: ""
      t.string :description, default: ""
      t.belongs_to :university, null: false

      t.timestamps
    end
  end
end
