class CreateFights < ActiveRecord::Migration[5.1]
  def change
    create_table :fights do |t|
      t.references :attacker
      t.references :defender
      t.integer :attack
      t.integer :defence

      t.timestamps
    end
  end
end
