class CreateUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :universities do |t|
      t.string :name, null: false, default: ""
      t.string :description, default: ""

      t.timestamps
    end
  end
end
