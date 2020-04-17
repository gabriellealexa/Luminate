class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
        t.integer :admirer_id
        t.integer :sweetheart_id
        t.string :status

      t.timestamps
    end

    add_index :connections, :admirer_id
    add_index :connections, :sweetheart_id
    add_index :connections, [:admirer_id, :sweetheart_id]


  end
end
