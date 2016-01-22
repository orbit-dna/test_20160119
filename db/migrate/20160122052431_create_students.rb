class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :sch_class, index: true, foreign_key: true
      t.string :name
      t.boolean :gender
      t.date :birth

      t.timestamps null: false
    end
  end
end
