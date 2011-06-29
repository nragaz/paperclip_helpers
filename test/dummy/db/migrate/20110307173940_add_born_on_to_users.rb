class AddBornOnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :born_on, :date
  end

  def self.down
    remove_column :users, :born_on
  end
end
