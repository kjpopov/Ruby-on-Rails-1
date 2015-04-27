class AddTitleBodyToProduct < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
    end

    create_table :categories do |t|
      t.string :name
      t.text :description
    end

    create_table :products do |t|
      t.belongs_to :brand, index: true 
      t.string :name
      t.text :description
    end
    
    add_column :products, :title, :string
    add_column :products, :body, :text
    add_column :products, :published, :boolean
  end
end
