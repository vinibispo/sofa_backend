class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.date :born_date
      t.string :phone_1
      t.string :phone_2

      t.timestamps
    end
  end
end
