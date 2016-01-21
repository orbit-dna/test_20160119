class CreateSchClasses < ActiveRecord::Migration
  def change
    create_table :sch_classes do |t|
      t.integer :grade
      t.integer :class_number
      t.string :teacher

      t.timestamps null: false
    end
  end
end
