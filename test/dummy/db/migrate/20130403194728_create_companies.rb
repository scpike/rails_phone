class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :customer_support_phone
      t.string :phone
      t.string :name

      t.timestamps
    end
  end
end
