class AddDefaultValueToVisited < ActiveRecord::Migration
  def up
    change_column :links, :visited, :boolean, :default => false
  end

  def down
    change_column :links, :visited, :boolean, :default => nil
  end
end
