class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.string :object
      t.string :body
      t.boolean :read

      t.timestamps
    end
  end
end
