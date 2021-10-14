class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.string :adress
      t.time :opening_time
      t.time :closing_time

      t.timestamps
    end
  end
end
