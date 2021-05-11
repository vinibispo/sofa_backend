class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :room
      t.float :area

      t.timestamps
    end
  end
end
