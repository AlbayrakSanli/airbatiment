class AddStripeCustomerIdToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :stripe_customer_id, :string
  end
end
