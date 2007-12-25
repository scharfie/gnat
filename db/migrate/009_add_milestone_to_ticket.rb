class AddMilestoneToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :milestone_id, :integer
  end

  def self.down
    remove_column :tickets, :milestone_id
  end
end
