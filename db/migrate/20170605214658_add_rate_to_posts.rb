class AddRateToPosts < ActiveRecord::Migration[5.0]
  def change
  add_column :posts, :speed :integer, :default => 1
  add_column :posts, :service, :integer, :default => 1
  add_column :posts, :price, :integer, :default => 1
  end
end
