class CreateSprintDiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :sprint_diaries do |t|
      t.references :scrum_member, foreign_key: true
      t.string :bdiary

      t.timestamps
    end
  end
end
