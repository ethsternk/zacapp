class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :contact
      t.integer :advanced_amount
      t.datetime :payment_date
      t.string :deducted_from_bl
      t.integer :amount_deducted
      t.integer :total_rebate

      t.timestamps
    end
  end
end
