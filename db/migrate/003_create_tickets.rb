class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :project_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
