class AddRatingToFriend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :rating, :integer
  end
end
