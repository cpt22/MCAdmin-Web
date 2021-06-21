class CreateServers < ActiveRecord::Migration[6.1]
  def change
    create_table :servers do |t|
      t.string :name, null: false, default: ""
      t.references :owner, index: true, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
