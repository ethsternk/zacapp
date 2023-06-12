class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state_or_province
      t.string :postal_code
      t.string :home_phone
      t.string :mobile_phone
      t.string :notes
      t.string :paid_in_full
      t.string :email

      t.timestamps
    end
  end
end
