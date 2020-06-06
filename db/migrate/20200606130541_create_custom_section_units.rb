class CreateCustomSectionUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_section_units do |t|
      t.string :name, null: false
      t.string :value

      t.belongs_to :custom_section, null: false

      t.timestamps
    end
  end
end
