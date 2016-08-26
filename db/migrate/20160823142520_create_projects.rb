class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.attachment :image
    	t.string :name
      t.string :description
      t.text :content

      t.timestamps null: false
    end
  end
end
