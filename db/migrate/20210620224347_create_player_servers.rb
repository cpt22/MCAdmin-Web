class CreatePlayerServers < ActiveRecord::Migration[6.1]
  def change
    create_table :player_servers do |t|
      t.bigint :player_id, null: false
      t.bigint :server_id, null: false
      t.boolean :status, default: false, null: false
      t.boolean :banned, default: false, null: false

      t.timestamps
    end

    add_index :player_servers, [:player_id, :server_id], unique: true

    add_foreign_key :player_servers, :players, on_delete: :cascade
    add_foreign_key :player_servers, :servers, on_delete: :cascade
  end
end
