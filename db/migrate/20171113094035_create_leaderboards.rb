class CreateLeaderboards < ActiveRecord::Migration[5.1]
  def change
    create_table :leaderboards do |t|
      t.time :stoptijd
      t.time :starttijd
      t.references :participant, foreign_key: true
      t.integer :game

      t.timestamps
    end
  end
end
