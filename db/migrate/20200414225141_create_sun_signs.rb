class CreateSunSigns < ActiveRecord::Migration[6.0]
  def change
    create_table :sun_signs do |t|
        t.string :name
        t.string :element
        t.string :info

        t.integer :user_id

      t.timestamps
    end
  end
end
