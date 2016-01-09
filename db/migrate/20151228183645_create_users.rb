class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :email_public, :default => true
      t.string :name
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
