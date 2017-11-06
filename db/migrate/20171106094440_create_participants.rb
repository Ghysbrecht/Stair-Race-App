class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :uid

      t.timestamps
    end
  end
end
