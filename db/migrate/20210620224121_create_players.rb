class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :uuid
      t.string :username

      t.timestamps
    end
  end
end
