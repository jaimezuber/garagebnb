class CreateGarages < ActiveRecord::Migration[6.1]
  def change
    create_table :garages do |t|
      t.references :owner, null: false, foreign_key: { to_table: 'users' }
      t.string :location

      t.timestamps
    end
  end
end
