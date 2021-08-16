class AddUserToNote < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :user, foreign_key: true
    # notes -> user_id
  end
end
