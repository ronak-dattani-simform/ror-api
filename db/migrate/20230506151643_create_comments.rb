class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment_body

      t.timestamps
    end

    add_reference :comments, :article, foreign_key: true
  end
end
