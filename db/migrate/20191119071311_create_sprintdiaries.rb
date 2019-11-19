class CreateSprintdiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :sprintdiaries do |t|
      t.references :surum_menber, foreign_key: true
      t.string :bdiary

      t.timestamps
    end
  end
end
