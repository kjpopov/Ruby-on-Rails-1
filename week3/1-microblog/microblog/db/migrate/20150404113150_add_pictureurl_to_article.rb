class AddPictureurlToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :pictureurl, :string
  end
end
