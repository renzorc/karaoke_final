class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :karaoke_id
      t.date :date_of_issue

      t.timestamps null: false
    end
  end
end
