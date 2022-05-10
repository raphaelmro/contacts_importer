class AddCcLastDigitsToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :cc_last_digits, :string
  end
end
