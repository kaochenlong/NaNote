class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :account
      t.string :password
      t.string :email

      t.timestamps
      # created_at
      # updated_at
    end
  end
end
