class RemoveFromFromKudos < ActiveRecord::Migration[5.0]
  def change
    remove_column :kudos, :from
  end
end
