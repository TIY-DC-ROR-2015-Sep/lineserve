class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.integer :line_count
      t.boolean :completely_uploaded, null: false, default: false

      t.timestamps null: false
    end
  end
end
