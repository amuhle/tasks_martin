class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :time_to_finish
      t.string :status
      t.belongs_to :user
      t.timestamps
    end
  end
end
