class AddBlogIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :blog_id, :integer
  end
end