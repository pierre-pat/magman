class CreateMagicians < ActiveRecord::Migration
  def change
    create_table :magicians do |t|
      t.string :firstname
      t.string :lastname
      t.references :user, index: true

      t.timestamps
    end
  end
end
