class CreateTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :terms do |t|
      t.string :name, limit: 20
      t.string :desc

      t.timestamps
    end
  end
end
