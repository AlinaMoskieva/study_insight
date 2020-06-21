class CreateDisciplines < ActiveRecord::Migration[5.1]
  def change
    create_table :disciplines do |t|
      t.string :name, null: false, default: ""

      t.belongs_to :curriculum, null: false

      t.timestamps
    end
  end
end
