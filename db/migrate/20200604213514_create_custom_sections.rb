class CreateCustomSections < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_sections do |t|
      t.string :name, null: false
      t.string :value

      t.references :targetable, polymorphic: true

      t.timestamps
    end
  end
end
