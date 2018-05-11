class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.text :merchant_id
      t.text :order_id
      t.text :amount
      t.text :currency
      t.text :redirect_url
      t.text :cancel_url
      t.text :language
      t.text :billing_name
      t.text :billing_address
      t.text :billing_city
      t.text :billing_state
      t.text :billing_zip
      t.text :billing_country
      t.text :billing_tel
      t.text :billing_email
      t.text :delivery_name
      t.text :delivery_address
      t.text :delivery_city
      t.text :delivery_state
      t.text :delivery_zip
      t.text :delivery_country
      t.text :delivery_tel
      t.text :merchant_param1
      t.text :merchant_param2
      t.text :merchant_param3
      t.text :merchant_param4
      t.text :merchant_param5
      t.text :promo_code
      t.text :customer_identifier
      t.text :integration_type

      t.timestamps
    end
  end
end
