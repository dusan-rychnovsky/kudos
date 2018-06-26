class CreateKudos < ActiveRecord::Migration[5.0]
  def change
    create_table :kudos do |t|
      t.string :from
      t.string :to
      t.string :for

      t.timestamps
    end
  end
end
