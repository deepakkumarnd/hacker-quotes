class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text       :body
      t.string     :author_name
      t.string     :author_description
      t.references :creator
      t.timestamps
    end
  end
end
