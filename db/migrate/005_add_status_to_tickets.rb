class AddStatusToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :status, :string, :default => 'new'
  end

  def self.down
    remove_column :tickets, :status
  end
end
