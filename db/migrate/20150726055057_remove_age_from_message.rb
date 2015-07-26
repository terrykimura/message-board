class RemoveAgeFromMessage < ActiveRecord::Migration
  def change
    remove_column :messages, :age, :integer
  end
end
