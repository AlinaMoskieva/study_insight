class CreateEducationalInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :educational_institutions do |t|
      t.string :name, null: false, default: ""
      t.timestamps
    end

    add_index :educational_institutions, :name, unique: true
  end
end
