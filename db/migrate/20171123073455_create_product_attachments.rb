class CreateProductAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :product_attachments do |t|
      t.integer :product_id,:index => true
      t.string :attachment
      t.string :description
      t.timestamps
    end
  end
end
