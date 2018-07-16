class ChangeTypeForKudosForToText < ActiveRecord::Migration[5.0]
  def change
    change_column :kudos, :for, :text
  end
end
