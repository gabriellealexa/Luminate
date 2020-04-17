class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.date :dob

      t.string :gender
      t.string :pronouns
      t.string :orientation
      t.string :bio

      t.integer :sun_sign_id

      t.timestamps
    end

  end
end
