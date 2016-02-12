class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :passwd
      t.integer :privilege
      t.integer :status

      t.timestamps null: false
    end
  end
end
