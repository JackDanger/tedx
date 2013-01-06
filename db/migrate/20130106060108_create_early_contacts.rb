class CreateEarlyContacts < ActiveRecord::Migration
  def change
    create_table :early_contacts do |t|
      t.string :name
      t.string :email, :null => false
      t.boolean :can_sponsor, :default => false, :null => false

      t.timestamps
    end
  end
end
