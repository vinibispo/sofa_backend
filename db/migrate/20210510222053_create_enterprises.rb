class CreateEnterprises < ActiveRecord::Migration[6.1]
  def change
    create_table :enterprises do |t|
      t.string :nome
      t.string :endereco

      t.timestamps
    end
  end
end
