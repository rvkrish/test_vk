class CreateTestmdls < ActiveRecord::Migration
  def change
    create_table :testmdls do |t|
      t.string :tst

      t.timestamps null: false
    end
  end
end
