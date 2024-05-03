class AddColumnsToFlowers < ActiveRecord::Migration[7.0]
  def change
    add_column :flowers, :date, :date
    add_column :flowers, :flower_name, :string
    add_column :flowers, :flower_info, :text
  end
end
