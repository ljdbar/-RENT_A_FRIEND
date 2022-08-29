class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.string :categories
      t.integer :age
      t.string :location
      t.string :pronouns
      t.text :bio
      t.float :daily_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
