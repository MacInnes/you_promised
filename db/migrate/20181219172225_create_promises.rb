class CreatePromises < ActiveRecord::Migration[5.2]
  def change
    create_table :promises do |t|
      t.string :person
      t.string :name
      t.string :status, default: "in progress"

      t.timestamps
    end
  end
end
