class AddFieldsToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :first_name, :string
    add_column :owners, :last_name, :string
    add_column :owners, :description, :text 
  end
end
