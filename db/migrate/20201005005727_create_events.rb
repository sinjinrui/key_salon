class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name,             null: false
      t.date :start_at,           null: false
      t.time :start_time,         null: false
      t.time :finish_time
      t.integer :enviroment_id,   null: false
      t.string :place,            null: false
      t.text :explanation,        null: false
      t.string :image
      t.references :user,         foreign_key: true

      t.timestamps
    end
  end
end