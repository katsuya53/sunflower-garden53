class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.text :record_text,   null: false
      t.references :user, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false
      t.timestamps
    end
  end
end
