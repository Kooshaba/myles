class AddMoreInfoToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.hstore :roles
    end
  end
end
