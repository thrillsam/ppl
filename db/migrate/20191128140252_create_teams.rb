class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :city_id
      t.string :color

      t.timestamps
    end
  end
end
