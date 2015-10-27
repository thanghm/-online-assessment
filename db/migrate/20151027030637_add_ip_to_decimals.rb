class AddIpToDecimals < ActiveRecord::Migration
  def change
    add_column :decimals, :ip, :string
  end
end
