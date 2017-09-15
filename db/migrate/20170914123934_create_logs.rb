class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.date :day
      t.integer :hour
      t.integer :minutes
      t.integer :log_type
      t.string :context
      t.text :log_message

      t.timestamps
    end
  end
end
