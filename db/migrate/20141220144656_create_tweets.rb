class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :retweets
      t.integer :favorited
      t.string :content
      t.timestamp :post_date

      t.timestamps null: false
    end
  end
end
