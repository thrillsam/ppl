class CreateUmpires < ActiveRecord::Migration[5.2]
  def change
    create_table :umpires do |t|
      t.string :name

      t.timestamps
    end
  end
end
