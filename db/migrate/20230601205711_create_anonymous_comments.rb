class CreateAnonymousComments < ActiveRecord::Migration[7.0]
  def change
    create_table :anonymous_comments do |t|
      t.text :description
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
