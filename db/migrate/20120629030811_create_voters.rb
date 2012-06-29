class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :voter_name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :email
      t.string :phone
      t.float :lat
      t.float :lng
      t.boolean :gmaps
      t.timestamps
    end
  end
end
