class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.belongs_to :document, index: true, foreign_key: true
      t.text :content
      t.integer :number

      t.timestamps null: false
    end
  end
end
