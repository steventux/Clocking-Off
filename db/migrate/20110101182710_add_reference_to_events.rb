class AddReferenceToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :reference, :string
  end
  def self.down
    remove_column :events, :reference
  end
end
