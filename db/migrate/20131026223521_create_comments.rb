class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.references :digital_object_identifier
      t.references :user

      t.timestamps
    end
  end
end
