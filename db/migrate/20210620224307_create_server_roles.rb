class CreateServerRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :server_roles do |t|
      t.bigint :user_id, null: false
      t.bigint :server_id, null: false
      t.integer :role, default: 25, null: false

      t.timestamps
    end

    add_index :server_roles, [:user_id, :server_id], unique: true

    add_foreign_key :server_roles, :users, on_delete: :cascade
    add_foreign_key :server_roles, :servers, on_delete: :cascade

  end
end
