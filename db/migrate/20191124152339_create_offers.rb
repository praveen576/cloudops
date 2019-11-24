class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :offer_code
      t.string :version
      t.datetime :published_at

      t.timestamps
    end
  end
end
