class AddPostedAtToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :posted_at, :datetime, Sdefault: -> { 'CURRENT_TIMETAMP()' }, null: false
  end
  end

