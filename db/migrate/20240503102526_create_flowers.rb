class CreateFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :flowers, if_not_exists: true do |t|
      t.timestamps
    end
  end
end