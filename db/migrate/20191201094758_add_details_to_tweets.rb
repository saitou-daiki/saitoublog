class AddDetailsToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :title, :string
  end
end
