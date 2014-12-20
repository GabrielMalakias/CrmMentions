class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :retweet_count
      t.integer :favorite_count
      t.string :text
      t.timestamp :created_at

      t.timestamps null: false
    end
  end
end
