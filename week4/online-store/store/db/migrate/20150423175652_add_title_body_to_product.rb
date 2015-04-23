class AddTitleBodyToProduct < ActiveRecord::Migration
  def change
  	create_table :products do |t|
      t.string :name
      t.text :description
    end
    
    add_column :products, :title, :string
    add_column :products, :body, :text
    add_column :products, :published, :boolean
  end
end
