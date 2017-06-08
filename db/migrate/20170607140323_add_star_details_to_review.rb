class AddStarDetailsToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :period, :integer
   add_column :reviews, :service, :integer
   add_column :reviews, :price, :integer
  end
end
