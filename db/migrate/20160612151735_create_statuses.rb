class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :title
      t.text :content
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
