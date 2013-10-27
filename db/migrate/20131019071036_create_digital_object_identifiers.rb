class CreateDigitalObjectIdentifiers < ActiveRecord::Migration
  def change
    create_table :digital_object_identifiers do |t|
      t.string :string_identifier
      t.integer :integer_identifier
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
