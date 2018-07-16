class AddToToKudos < ActiveRecord::Migration[5.0]
  def change
    add_reference :kudos, :to, index: true
    add_foreign_key :kudos, :users, column: :to_id
  end
end
