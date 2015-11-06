class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.string  :short_url
      t.string  :full_url
      t.boolean :visited

      t.timestamps
    end
  end
end
