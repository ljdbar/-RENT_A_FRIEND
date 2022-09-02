class AddRatingToFriend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :rating, :integer, default: 4
  end
end
