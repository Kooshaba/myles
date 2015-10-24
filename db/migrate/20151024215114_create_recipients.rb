class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
