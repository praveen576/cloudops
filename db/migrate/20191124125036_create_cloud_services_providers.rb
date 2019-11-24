class CreateCloudServicesProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :cloud_services_providers do |t|
      t.string :name, limit: 20
      t.string :desc

      t.timestamps
    end
  end
end
