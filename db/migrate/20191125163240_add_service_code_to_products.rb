class AddServiceCodeToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :service_code, :string, limit: 20
  end
end
