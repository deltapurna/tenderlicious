class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :address
      t.string :registration_number
      t.string :website

      t.timestamps
    end
  end
end
