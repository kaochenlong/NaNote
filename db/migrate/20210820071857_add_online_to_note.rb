class AddOnlineToNote < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :online_date, :datetime
  end
end
