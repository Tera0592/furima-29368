class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.integer :user_id,       foreign_key: true
      t.string  :name,          null: false
      t.text    :introduction,  null: false
      t.integer :price,         null: false
      t.integer :condition_id,  null: false
      t.integer :category_id,   null: false
      t.integer :fee_id,        null: false
      t.integer :place_id,      null: false
      t.integer :day_id,        null: false
      t.timestamps
    end
  end
end
