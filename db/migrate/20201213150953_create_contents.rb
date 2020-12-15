class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :content
      t.references :article, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
