class CreateOutcasts < ActiveRecord::Migration
  def change
    create_table :outcasts do |t|
      t.string :phone
      t.string :name

      t.timestamps
    end
  end
end
