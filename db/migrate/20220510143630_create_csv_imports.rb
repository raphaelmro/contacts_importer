class CreateCsvImports < ActiveRecord::Migration[6.1]
  def change
    create_table :csv_imports do |t|
      t.string :filename
      t.string :status
      t.integer :user_id, null: false
      t.index :user_id

      t.timestamps
    end
  end
end
