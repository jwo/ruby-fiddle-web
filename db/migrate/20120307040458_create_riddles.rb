class CreateRiddles < ActiveRecord::Migration
  def change
    create_table :riddles do |t|
      t.text :code
      t.timestamps
    end
  end
end
