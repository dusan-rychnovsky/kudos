class AddFromToKudos < ActiveRecord::Migration[5.0]
  def change
    add_reference :kudos, :from, index: true
    add_foreign_key :kudos, :users, column: :from_id
  end
end
