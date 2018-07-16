class RemoveToFromKudos < ActiveRecord::Migration[5.0]
  def change
    remove_column :kudos, :to
  end
end
