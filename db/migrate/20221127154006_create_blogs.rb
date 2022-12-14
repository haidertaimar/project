class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title,null: false
      t.text :detials,null: false

      t.timestamps
    end
  end
end
