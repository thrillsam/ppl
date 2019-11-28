class CreateMatchDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :match_details do |t|
   	  t.references :season, foreign_key: true
      t.references :city, foreign_key: true
      t.date :match_date
      t.references :team_1, foreign_key: { to_table: 'teams'}
      t.references :team_2, foreign_key: { to_table: 'teams'}
      t.references :toss_winner, foreign_key: { to_table: 'teams'}
      t.integer :toss_decision
      t.integer :result
      t.boolean :dl_applied, default: false
      t.references :match_winner, foreign_key: { to_table: 'teams'}
      t.integer :win_by_runs, limit: 3
      t.integer :win_by_wickets, limit: 2
      t.string :player_of_match
      t.references :venue, foreign_key: true
      t.references :umpire_1, foreign_key: { to_table: 'umpires'}
      t.references :umpire_2, foreign_key: { to_table: 'umpires'}
      t.references :umpire_3, foreign_key: { to_table: 'umpires'}
      t.timestamps
      t.timestamps
    end
  end
end
