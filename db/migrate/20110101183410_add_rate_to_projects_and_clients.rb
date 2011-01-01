class AddRateToProjectsAndClients < ActiveRecord::Migration
  def self.up
    add_column :projects, :rate, :integer
    add_column :clients, :rate, :integer
  end
  def self.down
    remove_column :projects, :rate
    remove_column :clients, :rate
  end
end
