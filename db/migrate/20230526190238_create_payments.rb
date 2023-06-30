class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :contact
      t.decimal :advanced_amount, precision: 8, scale: 2
      t.datetime :payment_date
      t.string :deducted_from_bl
      t.decimal :amount_deducted, precision: 8, scale: 2
      t.decimal :total_rebate, precision: 8, scale: 2

      t.timestamps
    end
  end
end
