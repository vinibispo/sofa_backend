class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :cep
      t.integer :number
      t.string :complement
      t.string :district
      t.integer :unity_number

      t.timestamps
    end
  end
end
