class CreateCommunications < ActiveRecord::Migration[5.2]
  def change
    create_table :communications do |t|
      t.references :practitioner, foreign_key: true
      t.datetime :sent_at

      t.timestamps
    end
  end
end
