class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password_digest
      t.string :email

      t.belongs_to :game, index: true
      t.boolean :dealer
      t.boolean :bust
      t.boolean :stay
      

      t.timestamps null: false
    end
  end
end
