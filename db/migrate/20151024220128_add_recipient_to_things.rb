class AddRecipientToThings < ActiveRecord::Migration
  def change
    add_reference :orders, :recipient, index: true
    add_reference :addresses, :recipient, index: true
  end
end
