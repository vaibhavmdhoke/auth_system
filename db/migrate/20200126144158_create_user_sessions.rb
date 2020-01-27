class CreateUserSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sessions do |t|
      t.datetime :expires_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
