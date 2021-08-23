class AddStateToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :state, :string
  end
end
