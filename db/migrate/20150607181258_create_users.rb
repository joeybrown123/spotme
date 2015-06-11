class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name_first
      t.text :name_last
      t.text :email

      t.timestamps

    end
  end
end
