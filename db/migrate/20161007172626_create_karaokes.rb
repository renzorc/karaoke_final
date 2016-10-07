class CreateKaraokes < ActiveRecord::Migration
  def change
    create_table :karaokes do |t|
      t.string :name
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
