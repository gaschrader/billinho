class CreateBills < ActiveRecord::Migration[7.1]
  def change
    create_table :bills do |t|
      t.decimal :bill_cost
      t.date :due_date
      t.references :enrollment, null: false, foreign_key: true
      t.string :status, default: 'Aberta'

      t.timestamps
    end
  end
end
