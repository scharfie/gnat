class AddCommentsToAudits < ActiveRecord::Migration
  def self.up
    add_column :audits, :comments, :text
  end

  def self.down
    remove_column :audits, :comments
  end
end
