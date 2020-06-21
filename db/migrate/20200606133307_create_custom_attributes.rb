class CreateCustomAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_attributes do |t|
      t.string :name, null: false
      t.string :value

      t.references :customizable, polymorphic: true, index: { name: :customizable_objects_index }

      t.timestamps
    end
  end
end
