class AddEstimateToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :estimate, :integer, :default => 0
  end

  def self.down
    remove_column :tickets, :estimate
  end
end
