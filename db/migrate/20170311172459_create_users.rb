class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :ip
      t.integer :hp, default: 100
      t.string :nickname
      t.integer :attack, default: 10
      t.integer :defence, default: 5
      t.datetime :deleted_at
      t.index :deleted_at

      t.timestamps
    end
  end
end
