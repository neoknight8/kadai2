class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :response_text
      t.references :micropost, foreign_key: true

      t.timestamps
    end
  end
end
