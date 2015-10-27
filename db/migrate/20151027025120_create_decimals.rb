class CreateDecimals < ActiveRecord::Migration
  def change
    create_table :decimals do |t|
      t.integer :number

      t.timestamps null: false
    end
  end
end
